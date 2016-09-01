#' Substitute Plus for Space in Font Name
#'
#' @param fontname \code{character} font name
#'
#' @return \code{character} font name with '+' instead of space
#' @export
gf_font_with_plus <- function(fontname=NULL) {
  if(grepl(x=fontname,pattern="[+]",perl=TRUE)){
    return(fontname)
  } else {
    gsub(
      x=fontname,
      pattern=" ",
      replacement="+"
    )
  }
}



#' Generate URL for Google Font
#'
#' @param fontname \code{character} valid Google Font name
#' @param customstyle \code{character} of custom weights and styles
#'
#' @return \code{character} url for Google Font
#' @export
gf_font_url <- function(fontname=NULL, customstyle=character()) {
  stopifnot(!is.null(fontname))

  sprintf(
    "https://fonts.googleapis.com/css?family=%s",
    paste0(
      gf_font_with_plus(fontname),
      ifelse(
        length(customstyle) > 0,
        paste0(
          ":",
          paste0(
            customstyle,
            collapse=","
          )
        ),
        ""
      )
    )
  )
}

#' Provide Dependency for Google Font
#'
#' @inheritParams gf_font_url
#'
#' @return \code{htmltools::htmlDependency}
#' @export
gf_font_dep <- function(fontname=NULL, customstyle=character()) {
  stopifnot(!is.null(fontname))

  dep_url <- gf_font_url(fontname)

  htmltools::htmlDependency(
    name = fontname,
    version = "0.1",
    src = c(href=dep_url),
    style = ""
  )
}

#' Add Google Fonts to 'tags' or 'tagList'
#'
#' @param tags \code{htmltools::tags} or \code{htmltools::tagList}
#' @inheritParams gf_font_dep
#'
#' @return \code{htmltools::tags} or \code{htmltools::tagList} with
#'           attached Google Font dependency
#' @export
gf_add_font <- function(tags=htmltools::tagList(), fontname=NULL, customstyle=character()) {
  stopifnot(!is.null(fontname))

  htmltools::attachDependencies(
    tags,
    gf_font_dep(fontname=fontname, customstyle=customstyle)
  )
}
