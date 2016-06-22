#' Writes SAS variable statement for input
#'
#' Writes SAS variable statement for SAS input statement.
#' Replaces all spaces with underscores "_" in variable name.
#'
#' @param var variable name
#' @param vtype variable type; either "character" or "numeric"
#'
#' @return character string in the form of "Variable_name" or "Variable_name $"
#'
#' @export
#'


sas_input <- function(var, vtype){
  if(vtype == "numeric"){
    stringr::str_replace_all(var, " ", "_")
  } else if(vtype == "character"){
    paste(stringr::str_replace_all(var, " ", "_"), "$")
  } else {
    stop("Not a variable type")
  }
}
