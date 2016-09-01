context("dependency")

test_that("gf_font_with_plus warns if no font name", {
  expect_error(gf_font_with_plus())
})

test_that("gf_font_with_plus subs space for plus", {
  expect_identical(gf_font_with_plus("Open Sans"),"Open+Sans")
})

test_that("gf_font_with_plus leaves alone if plus", {
  expect_identical(gf_font_with_plus("Open+Sans"),"Open+Sans")
})

test_that("gf_font_url errors if no font name", {
  expect_error(gf_font_url())
})

test_that("gf_font_url returns correct url", {
  expect_identical(gf_font_url("Open Sans"),"https://fonts.googleapis.com/css?family=Open+Sans")
})

test_that("google font url has not changed", {
  expect_type(
    readLines(gf_font_url("Open Sans")),
    "character"
  )
})

test_that("gf_font_dep errors if no font name", {
  expect_error(gf_font_dep())
})

test_that("gf_font_dep provides htmlDependency", {
  expect_identical(
    gf_font_dep("Open Sans"),
    htmltools::htmlDependency(
      name = "Open Sans",
      version = "0.1",
      src = c(href="https://fonts.googleapis.com/css?family=Open+Sans"),
      style = ""
    )
  )
})
