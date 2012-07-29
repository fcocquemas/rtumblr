\name{tumblrAuthenticate}
\alias{tumblrAuthenticate}
\title{Get Tumblr account information}
\usage{
  tumblrAuthenticate(user)
}
\arguments{
  \item{user}{list with values email and password.}
}
\value{
  list of Tumblr account information
}
\description{
  Get Tumblr account information
}
\examples{
user <- list(email="XXXXXXXX", password="XXXXXX")
tumblrAuthenticate(user)
}

