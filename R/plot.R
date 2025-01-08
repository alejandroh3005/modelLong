#' Plot ACF and longitudinal data
#'
#' @param data Data frame or list of  data
#' @param outcome Character title of outcome variable from data
#' @param time Character title of time variable from data
#' @param id Character title of id variable from data
#' @param col_group Character title of coloring variable from data
#'
#' @return List of GGplot objects for ACF values and longitudinal data
#' @export
#'
#' @examples
plot <- function(data, outcome, time, id, col_group = "") {
  library(dplyr)
  library(ggplot2)

  # Verify valid arguments
  stopifnot(
    typeof(outcome) == "character",
    typeof(time) == "character",
    typeof(col_group) == "character",
    typeof(data) == "list")

  # Organize data for plotting
  plot_data <- data %>%
    dplyr::select(any_of(c(ID = id, Outcome = outcome,
                           Time = time, Group = col_group))) %>%
    na.omit

  # Spaghetti plot of outcome over time
  if(col_group == "") {
    # Create plots without coloring by group
    gg_data <- ggplot2::ggplot(plot_data, aes(y = Outcome, x = Time)) +
      geom_line(aes(group = ID), alpha = 0.3, color = "#FC600A")
  }
  else {
    # Create plots with coloring by group
    gg_data <- ggplot(plot_data, aes(y = Outcome, x = Time, color = col_group)) +
      geom_line(aes(group = ID, color = Group), alpha = 0.3)
  }
  # Add title and theme
  gg_data <- gg_data +
    labs(title = paste("Repeated measures of", outcome),
         x = time, y = outcome) +
    theme_bw()


  # Autocorrelation function and plot
  acf_res <- acf(data %>% select(all_of(outcome)), plot = FALSE)$acf
  # Plot ACF values
  gg_acf <- ggplot(mapping = aes(x = 1:length(acf_res), y = acf_res)) +
    geom_col() +
    labs(title = paste("ACF of", outcome),
         x = paste("Difference in", time),
         y = "ACF") +
    theme_bw()


  return(list(data_plot = gg_data, acf_plot = gg_acf))
}
