\name{tumblrAuthenticate}
\alias{tumblrAuthenticate}
\title{Get Tumblr account information}
\usage{
  tumblrAuthenticate(user, verbose = FALSE)
}
\arguments{
  \item{user}{list with values email and password.}

  \item{verbose}{boolean for more verbosity, passed to
  RCurl}
}
\value{
  list of Tumblr account information
}
\description{
  Get Tumblr account information
}
\examples{
user <- list(email = "XXXXXXXX", password = "XXXXXX")
tumblrAuthenticate(user)
}

