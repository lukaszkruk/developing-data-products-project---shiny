library(shiny)
library(leaflet)

data = read.csv('dtm_basrah.csv')[c(4, 5, 7, 8, 12)]               

shinyServer(

    function(input, output) {

        output$table <- renderDataTable({          
            if (input$districtPicker != "All"){
                data <- data[data$District == input$districtPicker,]
            }
            
            data[,c(1,2,5)]
        })
        
        output$map <- renderLeaflet({
            if (input$districtPicker != "All"){
                data <- data[data$District == input$districtPicker,]
            }
            
            leaflet(data) %>% 
                addTiles() %>%
                addCircleMarkers(radius = ~IDPs.Families/8,
                                 popup = ~paste(Location.Name)
                ) 
        })
        
        output$count = renderText({
            if (input$districtPicker != "All"){
                data <- data[data$District == input$districtPicker,]
            }
            
            sum(data$IDPs.Families)
#             read.csv('dtm_basrah.csv')[1,1]
        })
    }
)