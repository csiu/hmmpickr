context("Loading")

test_that("load_chromhmm_model creates a list of 3", {
  model_file <-
    system.file("extdata", "model_roadmap15.txt", package="hmmpickr")

  m <- load_chromhmm_model(model_file)

  expect_that(m, is_a("list"))

  expect_length(m, 3)

  expect_equal(names(m), c("num_states", "emissions", "transitions"))

  expect_that(m$num_states, is_a("numeric"))
  expect_that(m$emissions, is_a("data.frame"))
  expect_that(m$transitions, is_a("data.frame"))

  expect_equal(names(m$emissions), c("state", "mark", "markname", "prob"))
  expect_equal(names(m$transitions), c("from", "to", "prob"))
})
