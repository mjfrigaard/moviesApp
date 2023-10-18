#' Test logger (test utility)
#' 
#' @description
#' This is an example test helper function that's also part of the package 
#' namespace. Functions in the `tests/testthat/` folder with a `<helper>.R` 
#' prefix will be automatically loaded. 
#' 
#'
#' @param start test start message 
#' @param end test end message 
#' @param msg test message 
#'
#' @return message to test output
#'
test_logger <- function(start = NULL, end = NULL, msg) {
  if (is.null(start) & is.null(end)) {
    cat("\n")
    logger::log_info("{msg}")
  } else if (!is.null(start) & is.null(end)) {
    cat("\n")
    logger::log_info("\n[ START {start} = {msg}]")
  } else if (is.null(start) & !is.null(end)) {
    cat("\n")
    logger::log_info("\n[ END {end} = {msg}]")
  } else {
    cat("\n")
    logger::log_info("\n[ START {start} = {msg}]")
    cat("\n")
    logger::log_info("\n[ END {end} = {msg}]")
  }
}