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
  if (is_installed(package)) {
    return(invisible())
  } else {
    stop("Please install '{package}' before continuing")
  }
}