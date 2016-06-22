#' Writes the SAS import code to external file
#'
#' \code{export_sas_code} writes a data.frame of SAS code to external .sas file.
#'
#' @param dataset a data.frame of SAS code
#' @param file location to write file to. Must include .sas extension.
#'
#' @export
#'

sas_code_export <- function(dataset, file){
  write.table(dataset,
  						file = file,
  						append = FALSE,
  						quote = FALSE,
  						row.names = FALSE,
  						col.names = FALSE)
}
