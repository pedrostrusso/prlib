#' Get the name of a file in a package where a function is defined
#'
#' @param f An unquoted string with the name of the function to look up.
#'
#' @return A path to the file where the function is defined.
#' @export
#'
#' @examples
#' function_file(function_file)
function_file <- function(f){
    src <- attr(attr(f, "srcref"), "srcfile")
    return(src$filename)
}
