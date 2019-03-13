#' Re-set the row names of a data.frame with a column and delete it from the df.
#'
#' @param df A data.frame
#' @param column A character string denoting the column to be used for renaming.
#'
#' @return A data.frame with the given column as row names and without the column
#' @export
#'
#' @examples
name_rows <- function(df, column){
    rownames(df) <- df[, column]
    df[, column] <- NULL
    return(df)
}
