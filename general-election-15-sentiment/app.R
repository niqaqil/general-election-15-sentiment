#import library
library(shiny)
library(shinydashboard)
library(readr)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "General Election 15"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("map-o")),
      menuItem("GE15 Sentiment Analysis", tabName = "ge15", icon = icon("quote-right")),
      menuItem("Party Leader", tabName = "party", icon = icon("users")),
      menuItem("Data", tabName = "data", icon = icon("database")),
      menuItem("About this site", tabName = "about", icon = icon("info"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "overview",
        h3("Overview of Malaysia General Election 15"),
        fluidRow(
          valueBox(222, "Parliments", icon = icon("map-marker"), color = "teal"),
          valueBox(946, "Candidates", icon = icon("user"), color = "teal")
        ),
        h4("Result of Parliment"),
        fluidRow(
          box(
            title = "PH", "76 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("ph_img")
          ),
          box(
            title = "PN", "52 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("pn_img")
          ),
          box(
            title = "BN", "30 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("bn_img")
          ),
          box(
            title = "GPS", "23 seats", width = 2, height = 150, 
            status = "info", solidHeader = TRUE, imageOutput("gps_img")
          ),
          box(
            title = "PAS", "22 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("pas_img")
          )
        ),
        fluidRow(
          box(
            title = "GRS", "6 seats", width = 2, height = 150, 
            status = "info", solidHeader = TRUE, imageOutput("grs_img")
          ),
          box(
            title = "DAP", "5 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("dap_img")
          ),
          box(
            title = "WARISAN", "3 seats", width = 2, height = 150, 
            status = "info", solidHeader = TRUE, imageOutput("warisan_img")
          ),
          box(
            title = "BEBAS", "2 seats", width = 2, height = 150,
            status = "info", solidHeader = TRUE, imageOutput("bbs_img")
          ),
          box(
            title = "MUDA", "1 seat", width = 2, height = 150, 
            status = "info", solidHeader = TRUE, imageOutput("muda_img")
          )
        )
      ),
      tabItem(
        tabName = "ge15",
        h2("Sentiment Analysis of GE15"),
        fluidRow(
          box(
            title = "Input", width = 3, status = "primary", solidHeader = TRUE, collapsible = TRUE,
            selectInput("time", "Select timeframe", c("Pre-election", "during election", "Post-election"), selected = "during election")
          )
        ),
        fluidRow(
          box(
            title = "Frequency of tweets", background = "navy",
            #plotOutput("frequency_plot")
          ),
          box(
            title = "Word Cloud about #GE15", background = "aqua",
            # plotOutput("word_cloud")
          )
        ),
        fluidRow(
          box(
            title = "Distribution of sentiment score", background = "teal", 
            #plotOutput("distribute_score")
          ),
          box(
            title = "Sentiment tweets", background = "blue",
            #plotOutput("sentiment_bar")
          )
        )
      ),
      tabItem(
        tabName = "party",
        h2("Leader of Party"), 
        h4("This analysis is focused on three main party which is Pakatan Harapan, Perikatan Nasional, and Barisan Nasional"),
        fluidRow(
          box(
            title = "Input", width = 3, status = "success", solidHeader = TRUE, collapsible = TRUE,
            selectInput("leader", "Select leader", c("Anwar Ibrahim (PH)", "Muhyiddin Yassin (PN)", "Zahid Hamidi (BN)"))
          )
        ),
        fluidRow(
          box(
            title = "Frequency of tweets", background = "green",
            #plotOutput("frequency_plot_party")
          ),
          box(
            title = "Word Cloud", background = "lime",
          )
        ),
        fluidRow(
          box(
            title = "Distribution of sentiment score", background = "olive",
            #plotOutput("distribute_score_party")
          ),
          box(
            title = "Sentiment tweets", background = "green",
            #plotOutput("sentiment_bar_party")
          )
        )
      ),
      tabItem(
        tabName = "data"
      ),
      tabItem(
        tabName = "about",
        h3("About this project")
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$ph_img <- renderImage({
    list(src = "www/ph.png", width = 100, height = 70)
  }, deleteFile = F)
  output$pn_img <- renderImage({
    list(src = "www/pn.png", width = 100, height = 70)
  }, deleteFile = F)
  output$bn_img <- renderImage({
    list(src = "www/bn.png", width = 100, height = 70)
  }, deleteFile = F)
  output$gps_img <- renderImage({
    list(src = "www/gps.png", width = 100, height = 70)
  }, deleteFile = F)
  output$pas_img <- renderImage({
    list(src = "www/pas.png", width = 100, height = 70)
  }, deleteFile = F)
  output$grs_img <- renderImage({
    list(src = "www/grs.png", width = 100, height = 70)
  }, deleteFile = F)
  output$dap_img <- renderImage({
    list(src = "www/dap.png", width = 100, height = 70)
  }, deleteFile = F)
  output$warisan_img <- renderImage({
    list(src = "www/warisan.png", width = 100, height = 70)
  }, deleteFile = F)
  output$bbs_img <- renderImage({
    list(src = "www/bbs.png", width = 100, height = 70)
  }, deleteFile = F)
  output$muda_img <- renderImage({
    list(src = "www/muda.png", width = 100, height = 70)
  }, deleteFile = F)
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
