#' See the neighbors of a row in a data.frame
#'
#' @param x A \code{data.frame} to subset
#' @param row The index of the row to see
#' @param surround The number of rows around 'row' to see on each side. Default: 3
#' @param colnum The number of columns to select. Default: 6
#'
#' @details
#' This function is intended to provide a glimpse into the vicinity of a \code{data.frame}'s
#' row, returning the row in question, along with its \code{surround} previous and posterior
#' neighboring rows.
#'
#' @return A \code{data.frame}
#' @export
#'
#' @examples
#' neighbors(iris, 50, surround = 2)
neighbors <- function(x, row, surround=3, colnum=6){
    if(ncol(x) < colnum){
        colnum <- ncol(x)
    }
    prlib::stop_if(row > nrow(x),
                   "Argument 'row' is larger than the number of rows of data.frame")

    low_index <- row - surround
    high_index <- row + surround
    if(low_index < 0) low_index <- 0
    if(high_index > nrow(x)) high_index <- nrow(x)
    return(x[seq(low_index, high_index), seq_len(colnum)])
}
