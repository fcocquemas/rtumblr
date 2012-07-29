#' Get Tumblr account information
#' 
#' @export
#' @param user list with values email and password.
#' @param verbose boolean for more verbosity, passed to RCurl
#' @return list of Tumblr account information
#' @examples
#' user <- list(email = "XXXXXXXX", password = "XXXXXX")
#' tumblrAuthenticate(user)
tumblrAuthenticate <- function(user, verbose = FALSE) {
  # The URL to send the request to
  url <- "https://www.tumblr.com/api/authenticate"
  
  # The list of parameters to post
  params <- user

  # Convert the parameters to the HTTP POST format
  params <- listToParams(user)
  if(verbose) print(params)
  
  # Send the API request (POST)
  req <- getURL(url, postfields = params, 
                httpheader = c(Accept = "text/xml", Accept = "multipart/*"),
                verbose = verbose)
  
  # Parse the returned XML to a list
  xmlToList(xmlParse(req)[["/tumblr"]])
}

