#' @importFrom stats setNames
NULL

#' Flips a vector's values and its names
#'
#' @param x Vector to be flipped
#' 
#' @details This function is simply a wrapper for \code{setNames(names(x), x)}
#'
#' @export

#' @examples
#' x <- c(1, 2, 3)
#' names(x) <- c("a", "b", "c")
#' flip_vector(x)
flip_vector <- function(x){
    return(setNames(names(x), x))
}
