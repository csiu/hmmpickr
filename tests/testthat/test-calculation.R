context("Calculations")

test_that("homogeneity_cost returns a number that is the state cost", {
  expect_that(
    hmmpickr:::hmmpick_cost_state(0.25),
    is_a("numeric")
  )

  ## Values are true
  expect_that(
    hmmpickr:::hmmpick_cost_state(0.25),
    equals( min(0.25, 1-0.25) )
  )
  expect_that(
    hmmpickr:::hmmpick_cost_state(c(0.25, 0.75)),
    equals( min(0.25, 1-0.25) + min(0.75, 1-0.75) )
  )
})

test_that("hmmpick_cost_states returns a list of state costs", {
  row1 <- c(1,0.5)
  row2 <- c(1,0)
  emissions_probs <- rbind(row1, row2)
  rownames(emissions_probs) <- NULL

  penalty <- function(x){min(1-x,x)}

  ## Values are true
  expect_that(
    hmmpickr:::hmmpick_cost_states(emissions_probs, returntotal=TRUE),
    equals( sum(sapply(row1, penalty)) + sum(sapply(row2, penalty)) )
  )
  expect_that(
    hmmpickr:::hmmpick_cost_states(emissions_probs, returntotal=FALSE),
    equals( c(sum(sapply(row1, penalty)), sum(sapply(row2, penalty))) )
  )

  ## Length is true
  expect_length(
    hmmpickr:::hmmpick_cost_states(emissions_probs, returntotal=TRUE),
    1)
  expect_length(
    hmmpickr:::hmmpick_cost_states(emissions_probs, returntotal=FALSE),
    2)
})
