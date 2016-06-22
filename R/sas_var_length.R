#' Calculates the maximum length of a character vector
#'
#' Calulcates the maximum length of a character vector
#' to be used in a SAS variable length statement.
#'
#' @param var character vector
#'
#' @return maximum length of vector
#'
#' @export

sas_var_length <- function(var){
  max(nchar(var), na.rm = TRUE)
}
