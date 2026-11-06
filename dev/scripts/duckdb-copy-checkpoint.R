# Source must be quiescent. Windows may prevent copying while the file is open.
copy_checkpointed_database <- function(old, new) {
  if (file.exists(new)) stop('Destination exists; refusing to overwrite.')
  con <- DBI::dbConnect(duckdb::duckdb(), dbdir=old)
  tryCatch(DBI::dbExecute(con,'CHECKPOINT'),finally=DBI::dbDisconnect(con,shutdown=TRUE))
  if (file.exists(paste0(old,'.wal'))) stop('Source has a WAL after checkpoint; close other connections.')
  before <- unname(tools::md5sum(old))
  if (!file.copy(old,new,overwrite=FALSE)) stop('Could not copy checkpointed database.')
  after <- unname(tools::md5sum(old))
  copied <- unname(tools::md5sum(new))
  if (file.exists(paste0(old,'.wal')) || !identical(before,after) || !identical(before,copied)) stop('Source changed during copy; discard incomplete destination and retry with all connections closed.')
  invisible(new)
}
