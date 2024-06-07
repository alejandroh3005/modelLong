\name{plot}
\alias{plot}
\title{Plot ACF and repeated measures}
\usage{
plot(data, outcome, time, id, col_group)
}
\description{
Creates two GGPlot objects to visualize (1) repeated measures over time, with the option to color observations by group; and (2) the autocorrelation function (ACF). The data argument must be in long format. The generated plot of the data may be further manipulated (to multiple facets, with additional layers, etc.).
}
\examples{
data <- read.csv(
  "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))
plot_res <- plot(data = data,
                 outcome = "bweight",
                 time = "mage",
                 id = "mid",
                 col_group = "Low weight")
plot_res$data_plot
plot_res$acf_plot
}
