#' Create a design from package \code{rpact}
#'
#' Returned is a \code{GroupSequentialDesign} with inverse normal combination
#' test and Pocock boundaries for early stopping.
#' Sample sizes are computed by \code{rpact}.
#'
#' @param effect Alternative effect size
#' @param sig.level Desired level of significance
#' @param power Desired power level
#' @param two_armed Is a two-armed test regarded?
#' @param order Order of integration rule
#'
#' @export
rpact_design <- function(
    dist, effect, sig.level = 0.025, power = 0.8, two_armed = TRUE, order = 5L) {

    design_rp <- rpact::getDesignInverseNormal(
        kMax = 2,
        alpha = sig.level,
        beta = 1 - power,
        futilityBounds = 0,
        typeOfDesign = "P"
    )

    if (is(dist, "Normal")) {
        res <- rpact::getSampleSizeMeans(
            design_rp, normalApproximation = TRUE, alternative = effect * ifelse(
                two_armed, 1, sqrt(2)
                )
            ) 
    } else if (is(dist, "Binomial")) {
        res <- rpact::getSampleSizeRates(
            design_rp, groups = 2, normalApproximation = TRUE,
            pi1 = dist@rate_control, pi2 = dist@rate_control + effect
            )
    } else {
        break("Specified data distribution does not exist in adoptr!")
    }

    char <- rpact::getDesignCharacteristics(design_rp)

    n1 <- res$numberOfSubjects1[1,]
    n2 <- res$numberOfSubjects1[2,]

    c2_rp <- function(z){
        w1 <- 1 / sqrt(2)
        w2 <- sqrt(1 - w1^2)
        out <- (design_rp$criticalValues[2] - w1 * z) / w2
        return(out)
    }

    c1f <- ifelse(is(dist, "Normal"), stats::qnorm(char$futilityProbabilities) +
                      sqrt(res$numberOfSubjects1[1]) * effect / ifelse(two_armed, sqrt(2), 1),
                  design_rp$futilityBounds)
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
