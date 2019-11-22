library("rmarkdown")

render("surveys-report.Rmd", 
       output_dir = "reports",
       params = list(file = "data/plot1.csv"))
