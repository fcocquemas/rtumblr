# RTumblr

RTumblr is a R interface to the [Tumblr API v1](http://www.tumblr.com/docs/en/api/). It can be used to read and write tumblogs directly from R.

The main goal is to facilitate technical/R blogging directly from your R IDE. The end-to-end solution for this is not quite there yet.

## Note

* This is alpha software and has not been thoroughly tested yet. It should work fine, but use at your own risk. Functionality and documentation might be incomplete, and error handling is left to the underlying libraries.
* The [Tumblr API v2](http://www.tumblr.com/docs/en/api/v2) might provide richer functionality in some areas, but it is a bit trickier as it uses OAuth. I need to look into [ROAuth](http://cran.r-project.org/web/packages/ROAuth/index.html) to see if it is worth moving to it. OAuth would also be safer than keeping your Tumblr password in a plain text file somewhere.

## Installation

First, you will need dependencies `XML` and `RCurl`.

    install.packages("XML")
    install.packages("RCurl")

For now, the easiest way to install RTumblr is to use the `devtools` package to get the latest version straight from Github. Install the `devtools` package if you do not have it yet:

    install.packages("devtools")
    
Then load `devtools` and install `RTumblr` from Github.

    library(devtools)
    install_github("RTumblr", username = "fcocquemas")
    
## Reading from a tumblog

Reading from a given tumblog is easy and can be done without logging in.

    url <- "demo.tumblr.com"
    tumblrRead(url)
    tumblrRead(url, start=2, num=1)
    tumblrRead(url, id=459009076)
    tumblrRead(url, tagged="funny", filter="none")
    
To read drafts, queued and submitted posts from a tumblog you own, you need to authenticate with your email and password.

    url2 <- "(YOU).tumblr.com"
    user <- list(email="XXXXX@example.com", password="XXXXXX")
    tumblrRead(url2, user=user, state="draft")

## Getting information about your tumblogs

You can easily obtain information about your tumblogs.

    user <- list(email="XXXXX@example.com", password="XXXXXX")
    tumblrAuthenticate(user)

## Writing to your tumblogs

This needs to be expanded (and tested more). Here is a basic example of writing a regular post.

    url <- "(YOU).tumblr.com"
    user <- list(email="XXXXX@example.com", password="XXXXXX")
    regular_post <- list(type="regular", title="Lorem ipsum",
                         body="**Hello** _world_")
    tumblrWrite(url, user, regular_post)
    
You can provide various parameters, e.g. here to send it to the drafts rather than publish directly, not sending a twitter update if they are set up, specifying a given (past) date, and that the input format is markdown.

    tumblrWrite(url, user, regular_post, state="draft", send_to_twitter="no",
                date="2012-07-01 14:50:04", format="markdown")

Posting successfully will return a post ID, which you can reuse (in a `post_id=` parameter) to update the post, e.g. publish it from drafts.

## Licence

RTumblr is released under the MIT licence.

