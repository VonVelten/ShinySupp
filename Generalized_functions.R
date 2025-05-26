library(dplyr)
#' Title
#'
#' @param Mean Mean value of data
#' @param Prob Probability of observed data within intervael
#' @param Inter.Low Lower Value of the interval
#' @param Inter.High Higher Value of the interval
#' @param Sd.Min Minimal Value of Sd to test
#' @param Sd.Max Maximal Value of Sd to test
#' @param delta.Sd Precision required for estimation of Sd
#'
#' @return Estimated Sd for 
#' @export
#'
#' @examples
Prob2Std <- function(Mean,Prob,Inter.Low,Inter.High,Sd.Min=0.5,Sd.Max=10,delta.Sd=0.01){
  Sd.Mid=(Sd.Min+Sd.Max)/2
  delta.test=2*delta.Sd
  while(delta.test>delta.Sd){
    Delta.Prob.Low= abs(Prob-pnorm(Inter.High,mean=Mean,sd=Sd.Min)-pnorm(Inter.Low,mean=Mean,sd=Sd.Min))
    Delta.Prob.High=abs(Prob-pnorm(Inter.High,mean=Mean,sd=Sd.Max)-pnorm(Inter.Low,mean=Mean,sd=Sd.Max))
    if(Delta.Prob.High>Delta.Prob.Low){
      Sd.Max=Sd.Mid
      Sd.Mid=(Sd.Min+Sd.Max)/2
    }else{
      Sd.Min=Sd.Mid
      Sd.Mid=(Sd.Min+Sd.Max)/2
    }
    delta.test=Sd.Max-Sd.Min
  }
  return(Sd.Mid)
}



lenun <- function(x){
  return(length(unique(x)))
}





