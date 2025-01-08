#' Generate Table 1 summary by group
#'
#' @param data Data frame or list
#' @param group_var Name of variable to stratify summary
#' @param type List to assign variables to a given variable type
#'
#' @return A "Table 1" type summary of data
#' @export
#'
#' @examples
summary <- function(data, group_var = NULL, type = NULL) {

  # Load relevant libraries
  library(gtsummary)
  library(dplyr)

  # Verify arguments are valid
  stopifnot(
    typeof(group_var) %in% c("NULL", "character"),
    typeof(type) %in% c("NULL", "list"),
    typeof(data) == "list")

  # Create a gtsummary table
  gt_table1 <- data %>%
    gtsummary::tbl_summary(
      by = group_var,
      type = type,
      statistic = list(
        # Mean (IQR) for numeric variables
        all_continuous() ~ "{mean} ({p25}, {p75})",
        # Count (Percent) for categorical variables
        all_categorical() ~ "{n} ({p}%)")) %>%
    add_overall() %>%
    bold_labels() %>%
    modify_header(label ~ "**Variable**") %>%
    modify_spanning_header(c(stat_1, stat_2) ~ paste0("**", group_var, "**")) %>%
    as_gt()

  # Return summary table
  return(list(table1 = gt_table1))
  }
