#' Generate Table 1 summary by group
#'
#' @param data Data frame or list of  data
#' @param group_var Character title of variable to stratify summaries
#'
#' @return List of GT object for Table 1 summary of data
#' @export
#'
#' @examples
summary <- function(data, group_var="") {
  library(gtsummary)
  library(dplyr)

  # Verify valid arguments
  stopifnot(
    typeof(group_var) == "character",
    typeof(data) == "list")

  data <- data %>% dplyr::rename(Group = group_var)

  gt_table1 <- data %>%
    gtsummary::tbl_summary(
      by = Group,
      statistic = list(
        all_continuous() ~ "{mean} ({p25}, {p75})", # mean (IQR) for continuous
        all_categorical() ~ "{n} ({p}%)")) %>%   # count (percentage) for factors
    add_overall() %>%
    bold_labels() %>%     # makes the labels bold
    modify_header(label ~ "**Variable**") %>%  # Customize the header
    modify_spanning_header(c(stat_1, stat_2) ~ paste0("**", group_var, "**")) %>%
    as_gt()

  return(list(table1 = gt_table1))
}

# data <- read.csv(
#   "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
# data <- data[c("border", "bweight", "mage")]
# data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))
# summary_res <- summary(data = data, group_var = "Low weight")
# summary_res$table1
