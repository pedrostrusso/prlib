#' See an example of a data.frame
#'
#' @param x A data.frame to subset
#' @param rownum The number of rows to select
#' @param colnum The number of columns to select
#'
#' @details 
#' This function is intended just to provide a glimpse into a data.frame, 
#' returning the first \code{rownum} rows and \code{colnum} columns
#'
#' @return A data.frame 
#' @export
#'
#' @examples
#' examplify(mtcars)
examplify <- function(x, rownum=6, colnum=6){
    if(nrow(x) < rownum){
        rownum <- nrow(x)
    }
    if(ncol(x) < colnum){
        colnum <- ncol(x)
    }
    
    return(x[seq_len(rownum), seq_len(colnum)])
}
