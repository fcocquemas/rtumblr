\name{tumblrWrite}
\alias{tumblrWrite}
\title{Write posts from a given tumblog}
\usage{
  tumblrWrite(url, user, post, generator = "RTumblr",
    date = NULL, private = FALSE, tags = NULL,
    format = NULL, slug = NULL, state = "published",
    publish_on = NULL, send_to_twitter = NULL,
    post_id = NULL)
}
\arguments{
  \item{url}{domain of the tumblog to post to, NULL for
  your primary blog.}

  \item{user}{user list with values email and password.}

  \item{post}{a list with field type and other fields
  corresponding to the chosen type. See details.}

  \item{generator}{short API client description (64 or
  fewer characters), defaults to "RTumblr".}

  \item{date}{post (past) date, defaults to NULL for the
  moment the post is received.}

  \item{private}{boolean whether post is private, defaults
  to FALSE.}

  \item{tags}{character vector post tags, defaults to
  NULL.}

  \item{format}{"html" or "markdown", defaults to NULL for
  the default post format for the user.}

  \item{slug}{post URL slug (55 or fewer characters),
  defaults to NULL.}

  \item{state}{"published", "draft", "submission", "queue",
  defaults to "published".}

  \item{publish_on}{used with state "queue", date at which
  to publish post.  Defaults to NULL. Returns 401 error if
  date format is not understood.}

  \item{send_to_twitter}{if Twitter integration is enabled,
  "no", "auto" for an automatically generated summary, or a
  character vector for another message to send to Twitter.
  Defaults to NULL, which will follow tbe "twitter-enabled"
  value for this blog.}

  \item{post_id}{for edits, id of the post to modify,
  defaults to NULL.}
}
\value{
  if successful, the new post id, error messages otherwise
}
\description{
  Posts types are to be detailed. For now, examples are for
  regular posts.
}
\examples{
url <- "(YOU).tumblr.com"
user <- list(email="XXXXXXXX", password="XXXXXX")
regular_post <- list(type="regular", title="Lorem ipsum",
                     body="**Hello** _world_")
tumblrWrite(url, user, regular_post)
tumblrWrite(url, user, regular_post, state="draft", send_to_twitter="no")
tumblrWrite(url, user, regular_post, send_to_twitter="no",
            date="2012-07-01 14:50:04")
}

