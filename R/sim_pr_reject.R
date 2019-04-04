#' Simulate rejection probability
#'
#' Uses \code{adoptr::simulate}
#'
#' @param design design
#' @param delta effect size
#' @param dist data distribution
#'
#' @export
sim_pr_reject <- function(design, delta, dist) {
    simdata <- adoptr::simulate(
        design,
        nsim  = 10^6,
        dist  = dist,
        theta = delta,
        seed  = 42
    )
    return(list(
        prob = mean(simdata$reject),
        se   = sd(simdata$reject) / sqrt(nrow(simdata))
    ))
}

