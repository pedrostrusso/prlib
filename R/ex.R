#' @importFrom utils head
NULL

#' Examine the first elements of an object
#'
#' @param x An object to examine
#' @param ... Arguments to \code{head()} or \code{ex.data.frame()} (See details)
#'
#' @details
#' This function is intended to provide a look at an R object. For a data.frame,
#' it will return by default the first 6 rows and columns. For other non-list
#' objects, the function defaults to whatever \code{head()} returns.
#' For list objects (that aren't data.frames), the function will recursively
#' apply itself to all objects in the list.
#'
#' @return A data.frame
#' @export
#' @docType methods
#'
#' @examples
#' test <- list(iris, letters, list(mtcars, LETTERS))
#' ex(test)
ex <- function(x, ...){
    UseMethod("ex", x)
}
#' @export
ex.data.frame <- function(x, rownum=6, colnum=6, ...){
    if(nrow(x) < rownum){
        rownum <- nrow(x)
    }
    if(ncol(x) < colnum){
        colnum <- ncol(x)
    }

    res <- x[seq_len(rownum), seq_len(colnum)]
    return(res)
}
#' @export
ex.default <- function(x, ...){
    head(x, ...)
}
#' @export
ex.list <- function(x, ...){
    #res <- rapply(x, function(y) ex(y, ...), how="replace")
    res <- recurse(x, function(y) ex(y, ...))
    return(res)
}

recurse <- function (L, f){
    if(inherits(L, "data.frame")){
        f(L)
    }else if (!is.list(L)){
        f(L)
    }else{
        lapply(L, recurse, f)
    }
}
