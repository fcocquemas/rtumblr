\name{tumblrRead}
\alias{tumblrRead}
\title{Get Tumblr posts from a given tumblog}
\usage{
  tumblrRead(url, start = NULL, num = NULL, type = NULL,
    id = NULL, filter = NULL, tagged = NULL,
    chrono = FALSE, search = NULL, user = NULL,
    state = NULL)
}
\arguments{
  \item{url}{URL of the tumblog to read, without "http://"
  or trailing slash.  If "dashboard", read from the
  dashboard.}

  \item{start}{offset to start from (defaults to 0).}

  \item{num}{number of posts to return (defaults to 20,
  maximum is 50).}

  \item{type}{type of posts to return ("text", "quote",
  "photo", "link", "chat", "video", "audio", defaults to
  NULL for all posts).}

  \item{id}{ID of a specific post to return, supercedes
  start, num, and type.}

  \item{filter}{"text" for plain text, "none" for no
  post-processing (defaults to NULL for HTML).}

  \item{tagged}{posts with this tag, newest first (defaults
  to NULL).}

  \item{chrono}{used with tagged, TRUE to get oldest posts
  first (defaults to FALSE).}

  \item{search}{query to search for in posts (defaults to
  NULL).}

  \item{user}{list with values email and password, to use
  with state (defaults to NULL).}

  \item{state}{"draft", "queue", "submission" posts,
  requires user to be set (defaults to NULL).}
}
\value{
  list of posts matching the request.
}
\description{
  Get Tumblr posts from a given tumblog
}
\examples{
url <- "demo.tumblr.com"
tumblrRead(url)
tumblrRead(url, start=2, num=1)
tumblrRead(url, id=459009076)
tumblrRead(url, tagged="funny", filter="none")

url2 <- "(YOU).tumblr.com"
user <- list(email="XXXXXXXX", password="XXXXXX")
tumblrRead(url2, user=user, state="draft")
}

