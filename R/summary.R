#' Summarize data in a table
#'
#' @param data Data frame or list
#' @param group_var Character name of variable to stratify summary
#' @param type List assigning variables to their appropriate type
#'
#' @return List containing summary of data as a gt object
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

  # Prepare arguments dynamically
  tbl_args <- list(
    data = data,
    type = type,
    statistic = list(
      all_continuous() ~ "{mean} ({p25}, {p75})",
      all_categorical() ~ "{n} ({p}%)"))

  # Add `by` argument only if `group_var` is not NULL
  if (!is.null(group_var)) {
    tbl_args$by <- group_var
  }

  # Create the gtsummary table
  gt_table1 <- do.call(gtsummary::tbl_summary, tbl_args)

  # Modify table if `group_var` exists
  if (!is.null(group_var)) {
    gt_table1 <- gt_table1 %>%
      add_overall() %>%
      modify_spanning_header(c(stat_1, stat_2) ~ paste0("**", group_var, "**"))
  }

  # Format final output
  gt_table1 <- gt_table1 %>%
    bold_labels() %>%
    modify_header(label ~ "**Variable**") %>%
    as_gt()

  # Return summary table
  return(list(table1 = gt_table1))
}
