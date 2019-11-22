library("rmarkdown")
library("stringr")

args <- commandArgs(trailingOnly = TRUE)

if("-a" %in% args) {
  folder <- args[2]
  args <- Sys.glob(str_c(folder, "/*.csv"))
  
  if(length(args == 0)) {
    print("please provide a list of .csv files 
          
          To specify all .csv files, use -a and a data directory as input.")
  }
  
} else {
  args <- args
}

for(file in args)
{
  out_name <- str_split_fixed(string = file,
                               pattern = "[/|.]",
                               n = 3)
  out_name <- str_c(out_name[2], '.html')
  
  render("surveys-report.Rmd", 
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))
}
