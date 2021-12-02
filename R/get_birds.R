#functions

#' Get the bird data from the NiCalc database. It assumes you have already got a token from https://naturindeks.nina.no/Default.aspx 
#' @param myindicators a list from NiCalc::getIndicators()
#' @return a list of dataframes (one for each indicator ID)
#' @example 
#' \dontrun{
#' indicatordata=get_data_from_indicators(myindicators = myindicators)
#' head(indicatordata)
#' }

get_data_from_indicators<- function(myindicators){
  myindicatorsTib=dplyr::as_tibble(myindicators)
  
  listofdfs=list()
  for (i in 1:length(myindicatorsTib$id)){
    indicatorValues=NIcalc::getIndicatorValues(indicatorID = myindicatorsTib$id[i])
    listofdfs[[i]]=indicatorValues}
  
  return(listofdfs)
}

