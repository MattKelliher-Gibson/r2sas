#' Create SAS Import Code for r Data Frames
#'
#' \code{sas_import_code} creates SAS import code and stores it in a data frame.
#'
#' @param r_data an r data.frame or similar object
#' @param del the deliminator that will be used when the data.frame is exported
#' @param file the location of the exported data.frame where SAS will look for the data (use "\\' in windows)
#' @param nlength the length of all numeric variables
#'
#' @example
#' foo <- data.frame(ID = c(A:Z), Value = c(1:26))
#' sas_file <- "c\\data\\r_data.csv"
#'
#' foo_sas_import <- sas_import(foo, ",", sas_file)
#'
#' @export

sas_import_code <- function(r_data, del, file, nlength=3){
  output_data <- data.frame(IMPORT = r2sas::sas_infile(file, del), stringsAsFactors = FALSE)

  for (i in names(r_data)){
    if(class(r_data[[i]]) == "numeric"){
      output_data <- rbind(output_data, r2sas::sas_length(i, class(r_data[[i]]), nlength))
    } else {
      output_data <- rbind(output_data, r2sas::sas_length(i, class(r_data[[i]]), r2sas::sas_var_length(r_data, i)))
    }
  }

  output_data <- rbind(output_data, "input")

  for (j in names(r_data)){
    output_data <- rbind(output_data, r2sas::sas_input(j, class(r_data[[j]])))
  }

  output_data <- rbind(output_data, ";")
}
