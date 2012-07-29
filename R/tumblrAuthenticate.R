#' Get Tumblr account information
#' 
#' @export
#' @param user list with values email and password.
#' @return list of Tumblr account information
#' @examples
#' user <- list(email="XXXXXXXX", password="XXXXXX")
#' tumblrAuthenticate(user)
tumblrAuthenticate <- function(user) {
  # The URL to send the request to
  url <- "https://www.tumblr.com/api/authenticate"
  
  # The list of parameters to post
  params <- user

  # Convert the parameters to the HTTP POST format
  params <- listToParams(user)
  
  # Send the API request (POST)
  req <- getURL(url, postfields=params, 
                httpheader=c(Accept="text/xml", Accept="multipart/*"),
                verbose = FALSE)
  
  # Parse the returned XML to a list
  xmlToList(xmlParse(req)[["/tumblr"]])
}

