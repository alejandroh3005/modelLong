\name{summary}
\alias{summary}
\title{Summarize data in a table}
\usage{
summary(data, group_var, type)
}
\description{
Generate a Table 1 style summary of data, with an optional variable to stratify descriptions (overall summary statistics are always included). Data must be in long format.
}
\examples{
# Load repeated measures of adolescent tooth growth (must be of long format)
data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]
colnames(data)[3:4] <- c("Distance", "Age")

# Summarize data, stratify by sex, and ensure age is encoded as continuous
summary_res <- modelLong::summary(
  data = data[-1],  # Ignore Subject ID
  group_var = "Sex",
  type = list(Age ~ "continuous"))

# View summary table
summary_res$table1

}
