library(shiny)

ui <- function(input,output,session){
 fluidPage(
   actionButton(inputId = "Crash",label="Crash the App")
 ) 
}



server <- function(input,output,session){
  
  
  observeEvent(input$Crash,{
    print("Crash Asked")
    a="1"*4
  })
  
  onUnhandledError(function(err){
    print("Une erreur est survenue")
  })
  
}



shinyApp(ui, server)
