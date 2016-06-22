#' Writes a SAS variable Length statement
#'
#' Writes a variable length statement for numeric and character variables.
#' This does not calculate the length it only writes a statement.
#'
#' 	@param var name of the variable
#' 	@param vtype variable type; either "numeric" or "character"
#' 	@param vlength length of variable
#'
#' 	@return character string in form of "Length Variable 4;"
#' 		or "Length Variable $ 12;"
#'

sas_length <- function(var, vtype, vlength){
  if(vtype == "numeric"){
    paste("Length", stringr::str_replace_all(var, " ", "_"), vlength, ";")
  } else if(vtype == "character"){
    paste0("Length ", stringr::str_replace_all(var, " ", "_"), " $", vlength, ";")
  } else {
    stop("Not a variable type")
  }
}
