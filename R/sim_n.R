#' Simulate sample size
#'
#' Uses \code{adoptr::simulate}
#'
#' @param design design
#' @param delta effect size
#' @param dist data distribution
#'
#' @export
sim_n <- function(design, delta, dist) {
    simdata <- simulate(
        design,
        nsim  = 10^6,
        dist  = dist,
        theta = delta,
        seed  = 42
    )
    return( list(
      n  = mean(simdata$n1 + simdata$n2),
      se = sd(simdata$n2) / sqrt(nrow(simdata))
    )
    )
}
