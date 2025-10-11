## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  cache = FALSE,  # Avoid caching issues
  autodep = TRUE,
  cache.lazy = FALSE
)

## ----example_discrete, echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, heigth=4----
library(PrecisionCalc)

# Simulated discrete data
 y_counts <- c(rpois(100, 3), rep(0,20))

# Plot histogram with fitted distributions
plot_distributionsD(y_counts)

## ----example_continuos, echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, heigth=4----
y_cont <- rgamma(100, shape = 2, rate = 0.5)
# Plot histogram with fitted distributions
plot_distributionsC(y_cont)

## ----example_relative_sample, echo=TRUE, warning=FALSE, message=FALSE---------
# Discrete data
relative_sample(y_counts, epsilon_rel = 0.1, Discrete = TRUE)

# Continuous data
relative_sample(y_cont, epsilon_rel = 0.1, Discrete = FALSE)

# Continuos data: ample size of a finite population (N_pop=300)
relative_sample(y_cont, epsilon_rel = 0.1, Discrete = FALSE, N=300)

## ----zip_example, echo=TRUE, warning=FALSE, message=FALSE---------------------
# Add some extra zeros
y_counts_zip <- y_counts
ycounts_zip<-c(y_counts, rep(0,20))

relative_sample_zip(y_counts_zip, epsilon_rel = 0.1)

## ----absolute_sample_example, echo=TRUE, warning=FALSE, message=FALSE---------
absolute_sample(y_counts, epsilon = 2, Discrete = TRUE)
absolute_sample(y_cont, epsilon = 2, Discrete = FALSE)

#Sample size of a finite population (N_pop=300)
absolute_sample(y_cont, epsilon = 2, Discrete = FALSE, N=300)

## ----bootstrap_example, echo=TRUE, warning=FALSE, message=FALSE---------------
set.seed(123)
# Sample size achieving desired relative precision with CI
bootstrap_precision(y_counts, epsilon_rel = 0.2, n_boot = 200)

# Sample size achieving desired absolute precision with CI
bootstrap_precision(y_counts, epsilon = 1, n_boot = 200)

#Sample size of a finite population (N_pop=300)
bootstrap_precision(y_counts, epsilon_rel = 0.2, n_boot = 200, N_pop=300)


## ----binomial_exemple, echo=TRUE, warning=FALSE, message=FALSE----------------
y_bin<-c(0,0,0,1,0,1,0,0,0,1,0,0,1,1)
sample_size_binomial (y_bin, p = NULL, epsilon=0.02, conf = 0.95, N = NULL)

## ----beta_example, echo=TRUE, warning=FALSE, message=FALSE--------------------
# Example with observed data including 0s
y_beta <- c(0.2, 0.1, 0, 0, 0, 0.4)
sample_size_beta(x = y_beta, epsilon = 0.05, conf = 0.95)

# Example with known Beta parameters
sample_size_beta(alpha = 2, beta = 5, epsilon = 0.05, conf = 0.95, N = 500)

## ----finite_exemple, echo=TRUE, warning=FALSE, message=FALSE------------------

n0 <- 50   # sample size from relative/absolute precision
N  <- 200  # total population size

finite_population_correction(n0, N)

## ----summary_table, echo=FALSE, warning=FALSE, message=FALSE------------------
# Create the table
functions_summary <- data.frame(
  Function = c(
    "plot_distributionsD()",
    "plot_distributionsC()",
    "relative_sample()",
    "relative_sample_zip()",
    "absolute_sample()",
    "bootstrap_precision()",
    "sample_size_binomial()",
    "sample_size_beta()",
    "finite_population_correction()"
  ),
  Purpose = c(
    "Visualize discrete count data with Poisson, NB, ZIP, Normal and Student-t fits",
    "Visualize continuous data with Student-t, Normal, Gamma, Lognormal fits",
    "Compute sample size for relative precision (discrete or continuous)",
    "Compute sample size for relative precision including ZIP distribution",
    "Compute sample size for absolute precision (discrete or continuous)",
    "Estimate precision using bootstrap sampling and confidence intervals",
    "Compute sample size for absolute precision for binomial data",
    "Compute sample size for absolute precision for percentage data (beta)",
    "Adjust sample size for finite populations (finite population correction)"
  ),
  Data_Type = c(
    "Discrete",
    "Continuous",
    "Both",
    "Discrete",
    "Both",
    "Both",
    "Presence/absence (1/0)",
    "Percentage",
    "Discrete"
  )
)

library(knitr)
knitr::kable(functions_summary, caption = "Summary of PrecisionCalc Functions")

