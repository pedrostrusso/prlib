#' Run multiple functions on a list
#'
#' @param ... Arguments containing the list to be transformed, and functions to
#' apply. The first argument should be the list, and following arguments should
#' be the functions.
#'
#' @details This function is used as an alternative to piping consecutive lapplys
#'
#' @return A list
#' @export
#'
#' @examples
#' split_cars <- split(mtcars, rep(1:3, length.out=nrow(mtcars),
#' each=ceiling(nrow(mtcars)/3)))
#' res <- multi_lapply(split_cars, t, as.data.frame)
multi_lapply <- function(...) {
    arglist <- match.call(expand.dots = FALSE)$...
    var.names <- sapply(arglist, deparse)
    has.name <- (names(arglist) != "")
    var.names[has.name] <- names(arglist)[has.name]
    arglist <- lapply(arglist, eval.parent, n = 2)
    lst <- arglist[[1]]
    arglist[[1]] <- NULL

    for(func in arglist){
        lst <- lapply(lst, func)
    }
    return(lst)
}
