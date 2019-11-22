library("rmarkdown")

args <- commandArgs(trailingOnly = TRUE)

render("surveys-report.Rmd", 
       output_dir = "reports",
       params = list(file = args))
