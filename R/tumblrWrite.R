#' Write posts from a given tumblog
#' 
#' Posts types are to be detailed. For now, examples are for regular posts.
#' 
#' @export
#' @param url domain of the tumblog to post to, NULL for your primary blog.
#' @param user user list with values email and password.
#' @param post a list with field type and other fields corresponding to the 
#'   chosen type. See details.
#' @param generator short API client description (64 or fewer characters), 
#'   defaults to "RTumblr".
#' @param date post (past) date, defaults to NULL for the moment the post
#'   is received.
#' @param private boolean whether post is private, defaults to FALSE.
#' @param tags character vector post tags, defaults to NULL.
#' @param format "html" or "markdown", defaults to NULL for the default
#'   post format for the user.
#' @param slug post URL slug (55 or fewer characters), defaults to NULL.
#' @param state "published", "draft", "submission", "queue", defaults to
#'   "published".
#' @param publish_on used with state "queue", date at which to publish post.
#'    Defaults to NULL. Returns 401 error if date format is not understood.
#' @param send_to_twitter if Twitter integration is enabled, "no",
#'   "auto" for an automatically generated summary, or a character vector for
#'   another message to send to Twitter. Defaults to NULL, which will follow
#'   tbe "twitter-enabled" value for this blog.
#' @param post_id for edits, id of the post to modify, defaults to NULL.
#' @param verbose boolean for more verbosity, passed to RCurl
#' @return if successful, the new post id, error messages otherwise
#' @examples
#' url <- "(YOU).tumblr.com"
#' user <- list(email = "XXXXXXXX", password = "XXXXXX")
#' regular_post <- list(type = "regular", title = "Lorem ipsum",
#'                      body = "**Hello** _world_")
#' tumblrWrite(url, user, regular_post)
#' tumblrWrite(url, user, regular_post, state = "draft", send_to_twitter = "no") 
#' tumblrWrite(url, user, regular_post, send_to_twitter = "no",
#'             date = "2012-07-01 14:50:04")
#' 
tumblrWrite <- function(url, user, post,
                        generator = "RTumblr", date = NULL, private = FALSE,
                        tags = NULL, format = NULL, slug = NULL,
                        state = "published", publish_on = NULL,
                        send_to_twitter = NULL, post_id = NULL,
                        verbose = FALSE) {
  # The URL to send the request to
  req_url <- "https://www.tumblr.com/api/write"
    
  # Build the list of parameters
  params <- c(user, post, generator = generator, date = date, 
              private = ifelse(private, 1, 0), 
              tags = paste(tags, sep=","), format = format, 
              group = url, slug = slug, state = state, 
              "publish-on" = publish_on, "send-to-twitter" = send_to_twitter,
              "post-id" = post_id)
  
  # Convert the parameters to the HTTP POST format
  params <- listToParams(params)
  if(verbose) print(params)
  
  # Send the API request (POST)  
  req <- getURL(req_url,
                postfields = params,
                verbose = verbose)  
  req
}
