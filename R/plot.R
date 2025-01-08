#' Plot repeated measures and autocorrelation
#'
#' @param data Data frame or list
#' @param outcome Character name of outcome variable
#' @param time Character name of time variable
#' @param id Character name of identification variable
#' @param col_group Character name of grouping variable
#'
#' @return List containing visualizations of autocorrelation and repeated measures as ggplot objects
#' @export
#'
#' @examples
plot <- function(data, outcome, time, id, group_var = NULL) {

  # Load relevant libraries
  library(dplyr)
  library(ggplot2)

  # Verify arguments are valid
  stopifnot(
    typeof(outcome) == "character",
    typeof(time) == "character",
    typeof(group_var) %in% c("NULL", "character"),
    typeof(data) == "list")

  ## Plot repeated measures
  # Organize data for plotting
  plot_data <- data %>%
    dplyr::select(any_of(c(ID = id, Outcome = outcome,
                           Time = time, Group = group_var))) %>%
    na.omit

  # Spaghetti plot of outcome over time
  if(is.null(group_var)) {
    # Create plots without coloring by group
    gg <- ggplot2::ggplot(plot_data, aes(y = Outcome, x = Time)) +
      geom_line(aes(group = ID), alpha = 0.4) +
      # Add means
      geom_point(data = plot_data %>% group_by(Time) %>%
                   summarise(mean = mean(Outcome)),
                 aes(x = Time, y = mean), size = 3)
  }
  else {
    # Create plots with coloring by group
    gg <- ggplot(plot_data, aes(y = Outcome, x = Time, color = Group)) +
      geom_line(aes(group = ID, color = Group), alpha = 0.4) +
      # Add means
      geom_point(data = plot_data %>% group_by(Group, Time) %>%
                   summarise(mean = mean(Outcome)),
                 aes(x = Time, y = mean, color = Group), size = 3)
    }

  # Add title and theme
  gg <- gg +
    labs(title = paste("Repeated measures of", outcome),
         x = time, y = outcome) +
    theme_bw()

  ## Plot autocorrelation
  # Compute ACF plot its values
  acf_res <- acf(data %>% select(all_of(outcome)), plot = FALSE)$acf
  gg_acf <- ggplot(mapping = aes(x = 1:length(acf_res), y = acf_res)) +
    geom_col() +
    labs(title = paste("ACF of", outcome),
         x = paste("Difference in", time),
         y = "ACF") +
    theme_bw()

  return(list(data_plot = gg, acf_plot = gg_acf))
}
