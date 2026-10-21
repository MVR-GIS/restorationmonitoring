# Read-only OOXML inspection with R/xml2; no Excel recalculation or package install.
path <- 'dev/checkpoints/archive/research_question_ranks.xlsx'
stopifnot(file.exists(path))
fingerprint <- unname(tools::md5sum(path))
stage <- tempfile('question-ranks-'); dir.create(stage)
utils::unzip(path, exdir=stage)
read_xml_part <- function(p) xml2::xml_ns_strip(xml2::read_xml(file.path(stage,p)))
wb <- read_xml_part('xl/workbook.xml')
rels <- read_xml_part('xl/_rels/workbook.xml.rels')
relationship <- xml2::xml_find_all(rels,'.//Relationship')
targets <- setNames(xml2::xml_attr(relationship,'Target'),xml2::xml_attr(relationship,'Id'))
strings <- character()
if(file.exists(file.path(stage,'xl/sharedStrings.xml'))) {
  strings <- vapply(xml2::xml_find_all(read_xml_part('xl/sharedStrings.xml'),'.//si'),
    function(n) paste(xml2::xml_text(xml2::xml_find_all(n,'.//t')),collapse=''), '')
}
sheets <- xml2::xml_find_all(wb,'.//sheet')
result <- list()
for(sheet in sheets) {
  name <- xml2::xml_attr(sheet,'name')
  id <- xml2::xml_attr(sheet,'id')
  target <- targets[[id]]
  part <- if(startsWith(target,'/')) substring(target,2) else paste0('xl/',target)
  xml <- read_xml_part(part)
  cells <- xml2::xml_find_all(xml,'.//sheetData/row/c')
  data <- lapply(cells,function(n) {
    type <- xml2::xml_attr(n,'t'); value <- xml2::xml_text(xml2::xml_find_first(n,'v'))
    if(!is.na(type) && type=='s' && !is.na(value)) value <- strings[as.integer(value)+1L]
    if(!is.na(type) && type=='inlineStr') value <- paste(xml2::xml_text(xml2::xml_find_all(n,'.//t')),collapse='')
    data.frame(cell=xml2::xml_attr(n,'r'),value=value,
      formula=xml2::xml_text(xml2::xml_find_first(n,'f')),type=type,stringsAsFactors=FALSE)
  })
  data <- do.call(rbind,data)
  data <- data[!is.na(data$value) | !is.na(data$formula),,drop=FALSE]
  result[[name]] <- list(state=xml2::xml_attr(sheet,'state'),part=part,cells=data,
    merges=xml2::xml_attr(xml2::xml_find_all(xml,'.//mergeCell'),'ref'))
}
out <- 'dev/outputs/research-question-ranks'; dir.create(out,recursive=TRUE,showWarnings=FALSE)
jsonlite::write_json(list(source=path,md5=fingerprint,sheets=result),
  file.path(out,'workbook-inspection.json'),auto_unbox=TRUE,pretty=TRUE,na='null')
for(name in names(result)) {
  cat('\nSHEET:',name,'STATE:',result[[name]]$state,'NONEMPTY CELLS:',nrow(result[[name]]$cells),'\n')
  preview <- head(result[[name]]$cells,8)
  preview$value <- substr(preview$value,1,110)
  print(preview,row.names=FALSE,right=FALSE)
}
cat('\nWORKBOOK OBJECTS\n')
print(list.files(stage,recursive=TRUE)[grepl('comments|charts|drawing|vba',list.files(stage,recursive=TRUE))])
if(file.exists(file.path(stage,'xl/drawings/drawing1.xml'))) {
  drawing <- read_xml_part('xl/drawings/drawing1.xml')
  cat('Drawing text:',paste(xml2::xml_text(xml2::xml_find_all(drawing,'.//t')),collapse='; '),'\n')
}

# Preserve source cells and original wording; merged headers supply group context.
main <- result[['Ranked by Reach']]$cells
value_at <- function(cells,ref) {
  v <- cells$value[match(ref,cells$cell)]
  if(!length(v)) NA_character_ else v
}
goal <- objective <- NA_character_
questions <- lapply(3:51,function(i) {
  g <- value_at(main,paste0('A',i)); o <- value_at(main,paste0('B',i))
  if(!is.na(g)) goal <<- g
  if(!is.na(o)) objective <<- o
  data.frame(local_id=sprintf('WQ-%02d',i-2),source_cell=paste0('C',i),
    restoration_goal=goal,restoration_objective=objective,
    question=value_at(main,paste0('C',i)),
    upper_impounded=as.numeric(value_at(main,paste0('D',i))),
    lower_impounded=as.numeric(value_at(main,paste0('E',i))),
    unimpounded=as.numeric(value_at(main,paste0('F',i))),
    illinois_river=as.numeric(value_at(main,paste0('G',i))))
})
questions <- do.call(rbind,questions)
canonical <- function(x) trimws(gsub('[[:space:]\u00a0]+',' ',x))
stopifnot(nrow(questions)==49L,!anyDuplicated(canonical(questions$question)))
reach_sheets <- c('Upper Impounded','Lower Impounded','Unimpounded','Illinois River')
rank_fields <- c('upper_impounded','lower_impounded','unimpounded','illinois_river')
mapping <- list(); checks <- list(); projects <- list()
for(k in seq_along(reach_sheets)) {
  name <- reach_sheets[k]; cells <- result[[name]]$cells
  qcells <- cells[grepl('^A([3-9]|[1-4][0-9]|5[01])$',cells$cell),]
  ix <- match(canonical(qcells$value),canonical(questions$question))
  rows <- sub('A','',qcells$cell)
  ranks <- as.numeric(vapply(rows,function(n) value_at(cells,paste0('B',n)),''))
  stopifnot(length(ix)==49L,!anyNA(ix),!anyDuplicated(ix),
    identical(ranks,questions[[rank_fields[k]]][ix]),!is.unsorted(ranks),
    sum(ranks)==sum(1:49))
  checks[[name]] <- list(question_count=length(ix),rank_sum=sum(ranks),
    repeated_rank_positions=sum(duplicated(ranks)),agrees_with_main=TRUE)
  headers <- cells[grepl('^[A-Z]+1$',cells$cell) & !cells$cell %in% c('A1','B1'),]
  projects[[name]] <- headers$value
  marks <- cells[!grepl('^[AB][0-9]+$',cells$cell) & !grepl('^[A-Z]+[12]$',cells$cell),]
  if(nrow(marks)) for(j in seq_len(nrow(marks))) {
    mark_row <- sub('^[A-Z]+','',marks$cell[j]); mark_col <- sub('[0-9]+$','',marks$cell[j])
    qix <- match(canonical(value_at(cells,paste0('A',mark_row))),canonical(questions$question))
    mapping[[length(mapping)+1L]] <- data.frame(reach=name,cell=marks$cell[j],
      local_question_id=questions$local_id[qix],project_label=value_at(cells,paste0(mark_col,'1')),mark=marks$value[j])
  }
}
links <- if(length(mapping)) do.call(rbind,mapping) else data.frame()
stopifnot(nrow(links)==20L,all(links$mark=='x'))
jsonlite::write_json(list(source_file=path,source_md5=fingerprint,
  identifier_note='WQ IDs are review-local worksheet locators, not program or production IDs.',
  rank_definition=value_at(main,'D1'),
  reach_labels=setNames(vapply(c('D2','E2','F2','G2'),function(ref) value_at(main,ref),''),rank_fields),
  limitations=c('Workshop dates, raw agency ratings, weighting rules and meaning of n are not supplied.',
    'An x is a recorded association with no supplied legend or evidence of a completed hypothesis test.',
    'Blank project cells are unrecorded associations, not documented absence or lack of suitability.',
    'Four embedded project/feature inventory images are historical reference material; their dates and current status are unverified.'),
  method='Merged group labels carried forward within Ranked by Reach; four sorted views reconciled by question text and rank. Original workbook not recalculated.',
  questions=questions,recorded_project_marks=links,reach_checks=checks,
  project_column_counts=vapply(projects,length,1L)),
  file.path('dev/goals','workshop-research-question-register.json'),auto_unbox=TRUE,pretty=TRUE,na='null')
cat('\nRECONCILIATION\n'); print(checks)
cat('Project columns:',vapply(projects,length,1L),'\n')
cat('Distinct project labels:',length(unique(canonical(unlist(projects)))),'\n')
cat('Goals:',length(unique(questions$restoration_goal)),'Objectives:',length(unique(questions$restoration_objective)),'\n')
cat('\nTOP FIVE PER REACH\n')
for(field in rank_fields) {
  cat(field,'\n')
  for(i in head(order(questions[[field]]),5)) cat(questions$local_id[i],questions[[field]][i],questions$question[i],'\n')
}
cat('\nPROJECT MARKS\n'); print(links,row.names=FALSE)
stopifnot(identical(fingerprint,unname(tools::md5sum(path))))
unlink(stage,recursive=TRUE)
