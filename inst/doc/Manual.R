## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  cache = FALSE,  # Avoid caching issues
  autodep = TRUE,
  cache.lazy = FALSE
)

## ----example_discrete, echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, fig.heigth=4----
library(PrecisionCalc)
data(picinguaba)
lumb<-picinguaba$Lumbrineris
plot_distributionsD(lumb)

## ----example_continuous, echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, heigth=4----
data(ubatuba)
temp<-ubatuba$temp
plot_distributionsC(temp)

## ----example_relative, warning=FALSE------------------------------------------
relative_sample(picinguaba$Lumbrineris, 0.2, Discrete = TRUE)

## -----------------------------------------------------------------------------
relative_sample(picinguaba$Lumbrineris, epsilon_rel = 0.2, Discrete = TRUE, N=300)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, fig.heigth=4-------
plot_distributionsD(ubatuba$S)
absolute_sample(ubatuba$S, epsilon = 2) ## Discrete 

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7, fig.heigth=4-------
data(sargassum)
plot_distributionsD(sargassum$Bra_Density) # plot of distribution fit of the data

## ----warning=FALSE------------------------------------------------------------
data(sargassum)
Bra_NB<-MASS::fitdistr(sargassum$Bra_Density, "Negative Binomial") # fit of the negative binomial distribution)
Bra_Norm<-MASS::fitdistr(sargassum$Bra_Density, "Normal") # fit of the normal distribution)
AIC(Bra_NB, Bra_Norm) # AIC test

## ----warning=FALSE------------------------------------------------------------
data(sargassum)
absolute_sample(sargassum$Bra_Density, epsilon = 1, N=400) 

## ----warning=FALSE------------------------------------------------------------
sample_size_beta (sargassum$Cob_Cover, epsilon=0.1)

## ----warning=FALSE------------------------------------------------------------
sample_size_beta(alpha=3, beta=2, epsilon=0.1)

## ----warning=FALSE------------------------------------------------------------
sample_size_binomial(sargassum$Ita_PA, epsilon=0.1)

## ----warning=FALSE, message=FALSE, fig.width=7, fig.heigth=4------------------
absolute_sample(sargassum$Ita_PA, epsilon=0.1)

## ----warning=FALSE------------------------------------------------------------
sample_size_binomial (p=0.2, epsilon=0.05)

## ----warning=FALSE------------------------------------------------------------
sample_size_binomial (p=0.5, epsilon=0.04)

## -----------------------------------------------------------------------------
bootstrap_precision(picinguaba$Lumbrineris, epsilon_rel = 0.2)

## ----finite_exemple, echo=TRUE, warning=FALSE, message=FALSE------------------

n0 <- 50   # sample size from relative/absolute precision
N  <- 200  # total population size

finite_population_correction(n0, N)

