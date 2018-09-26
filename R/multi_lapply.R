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
    return(x2)
}
