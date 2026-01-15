proportion_z_test <- function(a,b,c,d, alpha = 0.05, outcome_name = "") {
  
  n1 <- a + b
  n2 <- c + d
  
  p1 <- a / n1
  p2 <- c / n2
  
  S <- sqrt((p1 * (1 - p1) / n1) + (p2 * (1 - p2) / n2))
  z0 <- (p1 - p2) / S
  cv <- qnorm(1 - alpha)
  p_val <- pnorm(z0, lower.tail = FALSE)
  
  
  cat("\nOutcome:", outcome_name, "\n")
  cat("z statistic =", round(z0, 3), "\n")
  cat("Critical value =", round(cv, 3), "\n")
  cat("p-value =", round(p_val, 3), "\n")
  
  if (z0 > cv) {
    cat("Conclusion: Reject H0 → Higher prevalence in High HDL group\n")
  } else {
    cat("Conclusion: Fail to reject H0 → No significant difference\n")
  }
}