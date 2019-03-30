#' Create a design from package \code{rpact}
#'
#' Returned is a \code{GroupSequentialDesign} with inverse normal combination
#' test and Pocock boundaries for early stopping.
#' Sample sizes are computed by \code{rpact}.
#'
#' @param effect Alternative effect size
#' @param sig.level Desired level of significacne
#' @param power Desired power level
#' @param two_armed Is a two-armed test regarded?
#' @param order Order of integration rule
#'
#' @export
rpact_design <- function(
    effect, sig.level = 0.025, power = 0.8, two_armed = TRUE, order = 5L) {

    design_rp <- rpact::getDesignInverseNormal(
        kMax = 2,
        alpha = sig.level,
        beta = 1 - power,
        futilityBounds = 0,
        typeOfDesign = "P"
    )

    res <- rpact::getSampleSizeMeans(
        design_rp, normalApproximation = TRUE, alternative = effect * ifelse(
            two_armed, 1, sqrt(2)
        )
    )

    char <- rpact::getDesignCharacteristics(design_rp)

    n1 <- res$numberOfPatientsGroup1[1,]
    n2 <- res$numberOfPatientsGroup1[2,]

    c2_rp <- function(z){
        w1 <- 1 / sqrt(2)
        w2 <- sqrt(1 - w1^2)
        out <- (design_rp$criticalValues[2] - w1 * z) / w2
        return(out)
    }

    c1f <- stats::qnorm(char$futilityProbabilities) +
        sqrt(res$numberOfPatientsGroup1[1]) * effect / ifelse(two_armed, sqrt(2), 1)
    c1e <- design_rp$criticalValues[1]


    rpact_design <- adoptr::GroupSequentialDesign(
        ceiling(n1),
        c1f,
        c1e,
        ceiling(n2),
        rep(2.0, order)
    )

    rpact_design@c2_pivots <- sapply(adoptr:::scaled_integration_pivots(rpact_design), c2_rp)

    return(rpact_design)

}
