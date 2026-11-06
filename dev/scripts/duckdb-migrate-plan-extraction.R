# One-time reviewed planning extraction migration into a new local database.
args <- commandArgs(trailingOnly=TRUE)
if (!length(args) %in% c(2L,3L)) stop('Supply EXISTING database, NEW database path and optionally relocated source PDF.')
old <- args[1]; new <- args[2]
if (!file.exists(old) || file.exists(new) || !dir.exists(dirname(new))) stop('Input must exist and output must be a new file in an existing directory.')
if (!requireNamespace('digest',quietly=TRUE)) stop('Install digest.')
worksheet <- 'dev/goals/steamboat-island-objectives-criteria.json'
x <- jsonlite::fromJSON(worksheet,simplifyVector=FALSE)
if (length(x$objectives)!=4L || length(x$criteria)!=11L || length(x$response_triggers)!=5L) stop('Unexpected extraction counts; review first.')
pdf <- if(length(args)==3L) args[3] else file.path('..',x$source$file)
if (!file.exists(pdf) || digest::digest(file=pdf,algo='sha256',serialize=FALSE)!=x$source$sha256) stop('Source PDF missing or differs from reviewed extraction.')
source('dev/scripts/duckdb-copy-checkpoint.R',local=TRUE)
copy_checkpointed_database(old,new)
con <- DBI::dbConnect(duckdb::duckdb(),dbdir=new)
tryCatch({
  sql <- paste(readLines('dev/schemas/duckdb-plan-extraction.sql',warn=FALSE),collapse='\n')
  statements <- trimws(strsplit(sql,';',fixed=TRUE)[[1]])
  put <- function(sql, ...) {
    params <- list(...)
    if (any(lengths(params)!=1L)) stop('Non-scalar migration parameter in ',sql,': ',paste(lengths(params),collapse=','))
    DBI::dbExecute(con,sql,params=params)
  }
  val <- function(v) if (is.null(v) || !length(v)) NA_character_ else as.character(v[[1]])
  passage_seq <- 0L; passage_ids <- new.env(parent=emptyenv())
  evidence <- function(item,table,keycol,key) {
    for (p in item) {
      k <- paste(p$pdf_page_1based,val(p$printed_page),val(p$section_or_table),sep='\u001f')
      if (!exists(k,envir=passage_ids,inherits=FALSE)) {
        passage_seq <<- passage_seq+1L
        put('INSERT INTO research_register.plan_passage VALUES (?, ?, ?, ?, ?)',passage_seq,'steamboat-feasibility',p$pdf_page_1based,val(p$printed_page),val(p$section_or_table))
        assign(k,passage_seq,envir=passage_ids)
      }
      put(paste0('INSERT INTO research_register.',table,' (',keycol,',passage_id) VALUES (?, ?)'),key,get(k,envir=passage_ids))
    }
  }
  DBI::dbWithTransaction(con,{
    for(s in statements[nzchar(statements)]) DBI::dbExecute(con,s)
    put('INSERT INTO research_register.plan_extraction VALUES (?, ?, ?, ?, ?, ?, ?)', 'steamboat-feasibility',x$source$file,x$source$sha256,digest::digest(file=worksheet,algo='sha256',serialize=FALSE),x$status,x$normalization,x$lifecycle)
    for(o in x$objectives) {
      put('INSERT INTO research_register.plan_objective VALUES (?, ?, ?, ?)',o$id,'steamboat-feasibility',o$name,o$source_text_normalized)
      evidence(o$evidence,'plan_objective_passage','objective_id',o$id)
      for(p in o$detailed_criterion_pdf_pages) put('INSERT INTO research_register.objective_detail_page VALUES (?, ?)',o$id,p)
    }
    for(c in x$criteria) {
      put('INSERT INTO research_register.plan_criterion VALUES (?, ?, ?, ?, ?, ?)',c$id,'steamboat-feasibility',c$statement_kind,c$summary,val(c$qualification),val(c$scope))
      put('INSERT INTO research_register.plan_objective_criterion VALUES (?, ?, ?, ?)',c$objective_id,c$id,'analyst-proposed','Worksheet grouping by named measure; not an EMMA identity.')
      evidence(c$evidence,'plan_criterion_passage','criterion_id',c$id)
      if (!is.null(c[['target']])) {
        t <- c[['target']]
        put('INSERT INTO research_register.plan_target VALUES (?, ?, ?, ?, ?, ?, ?, ?)',c$id,if(is.null(t$year)) NA_integer_ else t$year,val(t$metric),val(t$value),val(t$unit),if(!is.null(t$operator_as_worded)) val(t$operator_as_worded) else val(t$operator),val(t$reference),val(t$population))
      }
      conditions <- c(c[['conditions']], if(!is.null(c[['target']])) c[['target']][['conditions']] else NULL)
      for(i in seq_along(conditions)) {
        z <- conditions[[i]]
        if (is.list(z)) put('INSERT INTO research_register.plan_target_condition VALUES (?, ?, ?, ?, ?, ?, ?, ?)',c$id,i,'structured',val(z$metric),val(z$operator),val(z$value),val(z$unit),NA_character_)
        else put('INSERT INTO research_register.plan_target_condition VALUES (?, ?, ?, ?, ?, ?, ?, ?)',c$id,i,'text',NA_character_,NA_character_,NA_character_,NA_character_,as.character(z))
      }
      series <- c$target_series
      if (!is.null(series)) {
        names_to_store <- setdiff(names(series),c('years','unit','year_0_basis','later_years_basis'))
        for(n in names_to_store) {
          if(length(series[[n]]) != length(series$years)) stop('Mismatched target series: ',c$id,' ',n)
          for(i in seq_along(series$years)) {
            y <- series$years[[i]]
            basis <- if(y==0 && !is.null(series$year_0_basis)) series$year_0_basis else if(y!=0 && !is.null(series$later_years_basis)) series$later_years_basis else NA_character_
            put('INSERT INTO research_register.plan_target_series VALUES (?, ?, ?, ?, ?, ?)',c$id,n,y,as.character(series[[n]][[i]]),val(series$unit),basis)
          }
        }
      }
    }
    for(c in x$criteria) for(ref in c$referenced_criterion_ids) put('INSERT INTO research_register.plan_criterion_reference VALUES (?, ?)',c$id,ref)
    for(t in x$response_triggers) {
      put('INSERT INTO research_register.plan_trigger VALUES (?, ?, ?, ?, ?)',t$id,'steamboat-feasibility',t$objective_id,t$condition,t$action)
      evidence(t$evidence,'plan_trigger_passage','trigger_id',t$id)
    }
    b <- x$mussel_benefit
    put('INSERT INTO research_register.plan_benefit VALUES (?, ?, ?, ?)', 'steamboat-feasibility',b$classification,b$dedicated_postconstruction_mussel_surveys,b$external_data_opportunity)
    evidence(b$evidence,'plan_benefit_passage','plan_id','steamboat-feasibility')
    for(z in x$reconciliation_needed) put('INSERT INTO research_register.plan_reconciliation_issue VALUES (?, ?, ?)',z$id,'steamboat-feasibility',z$issue)
  })
  print(DBI::dbGetQuery(con,"SELECT 'objectives' item, count(*) n FROM research_register.plan_objective UNION ALL SELECT 'criteria',count(*) FROM research_register.plan_criterion UNION ALL SELECT 'target series values',count(*) FROM research_register.plan_target_series UNION ALL SELECT 'triggers',count(*) FROM research_register.plan_trigger"))
},finally=DBI::dbDisconnect(con,shutdown=TRUE))
cat(normalizePath(new,winslash='/'),'\n')
