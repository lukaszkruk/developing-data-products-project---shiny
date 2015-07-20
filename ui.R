library(leaflet)

shinyUI(fluidPage(
HTML('<style> p{text-align:justify} </style>'),
titlePanel(""),
sidebarLayout(

    sidebarPanel(
        h3('Readme'),
        p('This is a sample Shiny app developed for the Developing Data Products Coursera class.'),
        p('It uses a subset of data on Internally Displaced Persons in Iraq as of June 2015. 
          For the purpose of this technical exercise, a single Governorate (Basrah) has been selected.
          The data and more information are available at iomiraq.net/dtm-page. '),
        p('You can use the District drop-down box below to subset the data to be displayed.
          The map and data table are updated according to your selection. '),
        p(''),
        selectInput('districtPicker',
                    '',
                    c('All',
                      'Abu Al-Khaseeb',
                      'Al-Midaina',
                      'Al-Qurna',
                      'Al-Zubair',
                      'Basrah',
                      'Fao',
                      'Shatt Al-Arab'
                    )
                    ),
        p('The total of IDP families in the area you selected is:'),
        textOutput('count')
    ),
    
    mainPanel(
        fluidRow(
            leafletOutput(outputId = 'map')    
        ),
        fluidRow(
            dataTableOutput(outputId="table")
        )  
    )
)

))
