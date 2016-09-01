#' Get Google Font Meta Information
#'
#' @return \code{data.frame}
#' @export
gf_meta <- function(){
  jsonlite::fromJSON(
    paste0(
      readLines(
        "https://fonts.google.com/metadata/fonts"
      )[-1],
      collapse=" "
    )
  )
}
