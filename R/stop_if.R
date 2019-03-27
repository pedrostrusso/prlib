#' Stop execution on TRUE
#'
#' @param expr Expression to evaluate
#' @param error Error message to return
#'
#' @details This is a convenience function that stops the running code when
#' \code{expr} is \code{TRUE} and displays the text in \code{error}.
#'
#' @return An object of class 'error'
#' @export
#'
#' @examples
#' # Using dontrun as the function returns an error
#' \dontrun{
#' a <- 2
#' stop_if(a==2, "a is equal to 2")
#'
#' # This is just a short form of
#' if(a == 2){
#'     stop("a is equal to 2")
#' }
#' }
stop_if <- function (expr, error) {
    if (expr) stop(error, call. = FALSE)
}
