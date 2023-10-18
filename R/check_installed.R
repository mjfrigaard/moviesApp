#' check if package is installed
#'
#' @param package
#'
#' @return invisible
#' 
#' @importFrom rlang is_installed
#'
#' @export
#'
#' @examples
#' check_installed("foo")
#' check_installed("base")
check_installed <- function(package) {
  if (rlang::is_installed(package)) {
    message("Installed")
  } else {
    cli::cli_abort("Please install '{package}' before continuing")
  }
}