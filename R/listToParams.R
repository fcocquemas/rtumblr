#' Collapse a single-level list to URL parameters
#' 
#' @param par list of parameters
#' @return character vector of URL parameters
listToParams <- function(par) {
  if(length(par) > 0) {
    par <- sapply(1:length(par), 
                  function(n) {
                    if(!is.null(par[[n]]))
                      paste(URLencode(names(par[n])),
                            URLencode(as.character(par[[n]])),
                            sep="=")
                    else ""
                  })
    par <- paste(par[par!=""], collapse="&")
  } else par <- ""
  par
}
