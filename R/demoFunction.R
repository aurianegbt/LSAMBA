#' Get monolix demo project path.
#'
#' @return path to the monolix demo from LSAMBA package.
#' @export
#'
#' @references Pasin C, Balelli I, Van Effelterre T, Bockstal V, Solforosi L, Prague M, Douoguih M, Thiébaut R, for the EBOVAC1 Consortium. 2019. Dynamics of the humoral immune response to a prime-boost Ebola vaccine: quantification and sources of variation. J Virol 93:e00579-19. https://doi.org/10.1128/JVI.00579-19.
#'
#' Alexandre M, Prague M, McLean C, Bockstal V, Douoguih M, Thiébaut R; EBOVAC 1 and EBOVAC 2 Consortia. Prediction of long-term humoral response induced by the two-dose heterologous Ad26.ZEBOV, MVA-BN-Filo vaccine against Ebola. NPJ Vaccines. 2023 Nov 8;8(1):174. doi: 10.1038/s41541-023-00767-y. PMID: 37940656; PMCID: PMC10632397.
#'
#' @examples
#' print(getMLXdir())
getMLXdir <- function(){
  return(system.file("extdata", "demoMLX.mlxtran", package = "LSAMBA"))
}
