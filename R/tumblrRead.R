#' Get Tumblr posts from a given tumblog
#' 
#' @export
#' @param url URL of the tumblog to read, without "http://" or trailing slash.
#'   If "dashboard", read from the dashboard.
#' @param start offset to start from (defaults to 0).
#' @param num number of posts to return (defaults to 20, maximum is 50).
#' @param type type of posts to return ("text", "quote", "photo", "link", 
#'   "chat", "video", "audio", defaults to NULL for all posts).
#' @param id ID of a specific post to return, supercedes start, num, and type.
#' @param filter "text" for plain text, "none" for no post-processing 
#'   (defaults to NULL for HTML).
#' @param tagged posts with this tag, newest first (defaults to NULL).
#' @param chrono used with tagged, TRUE to get oldest posts first (defaults to 
#'   FALSE).
#' @param search query to search for in posts (defaults to NULL).
#' @param user list with values email and password, to use with state 
#'   (defaults to NULL).
#' @param state "draft", "queue", "submission" posts, requires user to be set 
#'   (defaults to NULL).
#' @return list of posts matching the request.
#' @examples
#' url <- "demo.tumblr.com"
#' tumblrRead(url)
#' tumblrRead(url, start=2, num=1)
#' tumblrRead(url, id=459009076)
#' tumblrRead(url, tagged="funny", filter="none")
#' 
#' url2 <- "(YOU).tumblr.com"
#' user <- list(email="XXXXXXXX", password="XXXXXX")
#' tumblrRead(url2, user=user, state="draft")
tumblrRead <- function(url,
                       start=NULL, num=NULL, type=NULL, id=NULL,
                       filter=NULL, tagged=NULL, chrono=FALSE, search=NULL,
                       user=NULL, state=NULL) {
  # The URL to send the request to
  if(url=="dashboard") {
    url <- "https://www.tumblr.com/api/dashboard"
  } else url <- paste("http://", url, "/api/read", sep="")
  
  # Build the list of parameters
  params <- list(start=start, num=num, type=type, id=id,
                 filter=filter, tagged=tagged,
                 search=search, user=user, state=state)
  if(!is.null(tagged) & chrono) params$chrono <- 1
  
  # Convert the parameters to the HTTP GET format
  params <- listToParams(params)
  
  # Send the API request (POST/GET)
  url <- paste(url, "?", params, sep="")
  if(exists("post_params")) {
    req <- getURL(url,  
                  httpheader=c(Accept="text/xml", Accept="multipart/*"),
                  postfields=post_params,
                  verbose = FALSE)
  } else {
    req <- getURL(url,  
                  httpheader=c(Accept="text/xml", Accept="multipart/*"),
                  verbose = FALSE)
  }
  
  # Parse the returned XML to a list
  xmlToList(xmlParse(req)[["/tumblr"]])
}

