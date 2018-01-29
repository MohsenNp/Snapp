connect.to.db <- function(){
  library("RPostgreSQL")
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname = "postgres",
                   host = "localhost", port = 5432,
                   user = "", password = "")
  #on.exit(dbDisconnect(con))
  #on.exit(dbUnloadDriver(drv))
  return(con)
}

disconnect_all_connections <- function(){
  all_connections <- dbListConnections(PostgreSQL())
  for (conn in all_connections)
     dbDisconnect(conn)
  
}

#dbDisconnect(con)
#dbUnloadDriver(drv)
