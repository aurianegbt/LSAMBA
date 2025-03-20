#' Get monolix demo project path.
#'
#' @return path to the monolix demo from LSAMBA package.
#' @export
#'
#' @seealso \code{\link{dynFUN_demo}}.
#'
#' @examples
#' print(getMLXdir())
getMLXdir <- function(){
  return(system.file("extdata", "demoMLX.mlxtran", package = "LSAMBA"))
}
