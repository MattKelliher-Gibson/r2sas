#' Writes a SAS infile statement
#'
#' Writes a SAS infile statement.
#'
#' @param file the location of the text file to be imported into SAS
#' @param del the deliminator used in the text file stated above
#'
#' @return a character string in the form of:
#' 	"infile 'c:/text_file.txt' ',' MISSOVER DSD lrecl=32767 firstobs=2;"
#'
#' 	@export

sas_infile <- function(file, del){
  paste0("infile '", file, "' delimiter = '", del, "' MISSOVER DSD lrecl=32767 firstobs=2;")
}
