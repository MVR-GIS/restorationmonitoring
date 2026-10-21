# Reinspect the source edition used for MS-03. Run from the repository root.
# Optional --download acquires only absent public files; existing files are preserved.
args <- commandArgs(trailingOnly = TRUE)
instance <- jsonlite::fromJSON('dev/goals/mussel-vital-rates-instance.json', simplifyVector=FALSE)
folder <- 'dev/outputs/research-question'
dir.create(folder, recursive=TRUE, showWarnings=FALSE)
inventory <- lapply(instance$files, function(f) {
  path <- file.path(folder,f$name)
  if (!file.exists(path) && '--download' %in% args)
    utils::download.file(f$url,path,mode='wb',method='libcurl')
  if (!file.exists(path)) stop('Missing source: ',path,'; run with --download to acquire it.')
  if (!identical(unname(tools::md5sum(path)),f$md5)) stop('Source edition differs: ',f$name)
  rows <- cols <- NA_integer_
  if (grepl('csv$',f$name)) {
    # Preserve column labels, IDs and explicit missing-value codes for review.
    d <- read.csv(path,check.names=FALSE,colClasses='character',fileEncoding='latin1')
    rows <- nrow(d); cols <- ncol(d)
    stopifnot(rows==f$rows,cols==f$columns)
  }
  data.frame(file=f$source_name,md5=f$md5,rows=rows,columns=cols)
})
print(do.call(rbind,inventory),row.names=FALSE)
t <- read.csv(file.path(folder,'ms03-tracking-data.csv'),check.names=FALSE,colClasses='character')
p <- read.csv(file.path(folder,'ms03-plot-data.csv'),check.names=FALSE,colClasses='character',fileEncoding='latin1')
stopifnot(!anyDuplicated(t$ID),length(unique(t$Plot))==20L)
cat('Unique individuals:',length(unique(t$ID)),'; plots:',length(unique(t$Plot)),
    '; 2012 plot placement total:',sum(as.integer(p[p$Year=='2012','Number of mussels placed in 2012'])),'\n')
cat('Inventory only: no survival/growth estimates or corrections to source data.\n')
