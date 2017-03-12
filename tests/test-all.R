if (require('hmmpickr', quietly=TRUE)){
  testthat::test_check("hmmpickr")
} else {
  warning('cannot run unit tests -- package "hmmpickr" is not available')
}
