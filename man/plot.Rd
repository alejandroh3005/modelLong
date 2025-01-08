\name{plot}
\alias{plot}
\title{Plot repeated measures and autocorrelation}
\usage{
plot(data, outcome, time, id, group_var)
}
\description{
Plots repeated measures and averages over time, well as autocorrelation between those measures calculated with acf(). Returned ggplot objects may be further manipulated (to multiple facets, with additional layers, etc.). Data must be in long format.
}
\examples{
library(ggplot2)

# Load repeated measures of adolescent tooth growth (must be of long format)
data <- read.csv(
  "https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

# Plot the repeated measures and autocorrelation
plot_res <- modelLong::plot(
  data = data,
  outcome = "distance",
  time = "age",
  id = "Subject",
  group_var = "Sex")

# View repeated measures plot
plot_res$data_plot +
  # Adjust labels and x-axis
  labs(title = "Repeated measures of tooth growth") +
  xlab("Age (years)") + ylab("Distance (mm)") +
  scale_x_continuous(breaks = seq(8,18,2))

# View autocorrelation plot
plot_res$acf_plot +
  # Adjust labels and x-axis
  labs(title = "Autocorrelation of tooth growth") + xlab("Age (years)")

}
