library(rmarkdown)
library(stringr)


parse_arguments <- function(files){

  ## Input: a vector with terminal input
  ## output: a vector of files to render
  args <- files
  
  if("-a" %in% files) {
    folder <- args[2]
    args <- Sys.glob(str_c(folder, "/*.csv"))
    
    if(length(args == 0)) {
      print("please provide a list of .csv files 
          
          To specify all .csv files, use -a and a data directory as input.")
    }
    
  } else {
    args <- args
  }
  
  # return vector of file names, i.e. args
  return(args)
 
}

render_doc <- function(file){
  
  #input: a csv file to run the Rmd on
  #output: an .html file written to the reports folder.
  
  out_name <- str_split_fixed(string = file,
                              pattern = "[/|.]",
                              n = 3)
  out_name <- str_c(out_name[2], '.html')
  
  render("surveys-report.Rmd", 
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))

}

render_docs <- function(files){
  #input: a vector of file names
  #output: calls the render_doc function for each file
  
  for(file in files) {
    render_doc(file)
  }

}

main<-function(){
  #call functions from above to render the documents
  
  # read in from terminal
  args <- commandArgs(trailingOnly = TRUE)
  
  # parse the terminal args
  args_vector = parse_arguments(args)
  
  # render documents
  render_docs(args_vector)
  
}

main() # calls the main function
