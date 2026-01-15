pooled_t_test <- function(x1, x2, alpha = 0.05, outcome_name = "") {
  
  n1 <- length(x1)
  n2 <- length(x2)
  df <- n1 + n2 - 2
  
  mean1 <- mean(x1)
  mean2 <- mean(x2)
  
  var1 <- var(x1)
  var2 <- var(x2)
  
  sp <- ((n1-1) * var1 + (n2-1) * var2) / df
  t0 <- (mean1-mean2) / sqrt(sp * (1 / n1 + 1 / n2))
  cv <- qt(1-alpha, df)
  p_val <- pt(t0, df, lower.tail = FALSE)
  
  cat("\nOutcome:", outcome_name, "\n")
  cat("t statistic =", round(t0,3), "\n")
  cat("Critical value =", round(cv, 3), "\n")
  cat("p-value =", round(p_val, 3), "\n" )
  
  if (t0 > cv) {
    cat("Conclusion: Reject H0 → High HDL is associated with greater impairment\n")
  } else {
    cat("Conclusion: Fail to reject H0 → No evidence of greater impairment\n")
  }
}