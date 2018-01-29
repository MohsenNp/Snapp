bookInput <- function(input, output, session, stringsAsFactors) {
  datasetInput <- eventReactive(input$insert, {
    first <- 'INSERT INTO book(viewpoint, topic, title, firstpublishyear) VALUES ('
    viewpoint = paste('\'',input$viewpoint,'\'', sep = '')
    topic = paste('\'',input$topic,'\'', sep = '')
    title = paste('\'',input$title,'\'', sep = '')
    fpy = input$fpy
    query = paste(first,paste(viewpoint,topic,title,fpy, sep = ' ,'), ')')
    tryCatch(
      {
        dbGetQuery(con,query)
        return('done')
      },
      warning = function(war) {
        return('data is invalid')
        
      }, error = function(err) {
        
        # error handler picks up where error was generated
        return('data is invalid')
      }
    )  }
  )
  
  output$output <- renderText(
    datasetInput()
  )
}
