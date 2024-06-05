---
output: github_document
---

# Purpose

This is package for UW BIOST 561 (Spring 2024), taught by Kevin Lin.

- The URL to the GitHub (i.e., the source code) is: https://github.com/alejandroh3005
- The URL to the Pkgdown webpage is: https://alejandroh3005.github.io/

# How to install
This package is called `modelLong`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("alejandroh3005/modelLong")
```

Upon completion, you can run the following code (in R):
```R
library(modelLong)
modelLong::run_example()
```

# Dependencies

The package depends on the following packages: `tidyverse`, `nlme`, and `geepack`.

# Session info

This package was developed in the following environment
```R
> devtools::session_info()
─ Session info ────────────────────────────────────────────────────────
 setting  value
 version  R version 4.2.2 (2022-10-31 ucrt)
 os       Windows 10 x64 (build 18362)
 system   x86_64, mingw32
 ui       RStudio
 language (EN)
 collate  English_United States.utf8
 ctype    English_United States.utf8
 tz       America/Los_Angeles
 date     2024-06-05
 rstudio  2023.06.1+524 Mountain Hydrangea (desktop)
 pandoc   3.1.1 @ C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools/ (via rmarkdown)

─ Packages ────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 cachem        1.0.8   2023-05-01 [1] CRAN (R 4.2.3)
 callr         3.7.6   2024-03-25 [1] CRAN (R 4.2.3)
 cli           3.6.1   2023-03-23 [1] CRAN (R 4.2.3)
 crayon        1.5.2   2022-09-29 [1] CRAN (R 4.2.2)
 desc          1.4.3   2023-12-10 [1] CRAN (R 4.2.3)
 devtools      2.4.5   2022-10-11 [1] CRAN (R 4.2.3)
 digest        0.6.33  2023-07-07 [1] CRAN (R 4.2.3)
 ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.2.2)
 evaluate      0.23    2023-11-01 [1] CRAN (R 4.2.3)
 fansi         1.0.4   2023-01-22 [1] CRAN (R 4.2.2)
 fastmap       1.1.1   2023-02-24 [1] CRAN (R 4.2.2)
 fs            1.6.3   2023-07-20 [1] CRAN (R 4.2.3)
 glue          1.6.2   2022-02-24 [1] CRAN (R 4.2.2)
 htmltools     0.5.8   2024-03-25 [1] CRAN (R 4.2.3)
 htmlwidgets   1.6.4   2023-12-06 [1] CRAN (R 4.2.3)
 httpuv        1.6.15  2024-03-26 [1] CRAN (R 4.2.3)
 knitr         1.44    2023-09-11 [1] CRAN (R 4.2.3)
 later         1.3.2   2023-12-06 [1] CRAN (R 4.2.3)
 lifecycle     1.0.4   2023-11-07 [1] CRAN (R 4.2.3)
 magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.2.2)
 memoise       2.0.1   2021-11-26 [1] CRAN (R 4.2.2)
 mime          0.12    2021-09-28 [1] CRAN (R 4.2.0)
 miniUI        0.1.1.1 2018-05-18 [1] CRAN (R 4.2.3)
 pillar        1.9.0   2023-03-22 [1] CRAN (R 4.2.3)
 pkgbuild      1.4.4   2024-03-17 [1] CRAN (R 4.2.3)
 pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.2.2)
 pkgdown       2.0.7   2022-12-14 [1] CRAN (R 4.2.3)
 pkgload       1.3.4   2024-01-16 [1] CRAN (R 4.2.3)
 processx      3.8.2   2023-06-30 [1] CRAN (R 4.2.3)
 profvis       0.3.8   2023-05-02 [1] CRAN (R 4.2.3)
 promises      1.2.1   2023-08-10 [1] CRAN (R 4.2.3)
 ps            1.7.5   2023-04-18 [1] CRAN (R 4.2.3)
 purrr         1.0.2   2023-08-10 [1] CRAN (R 4.2.3)
 R6            2.5.1   2021-08-19 [1] CRAN (R 4.2.2)
 Rcpp          1.0.11  2023-07-06 [1] CRAN (R 4.2.3)
 remotes       2.5.0   2024-03-17 [1] CRAN (R 4.2.3)
 rlang         1.1.1   2023-04-28 [1] CRAN (R 4.2.3)
 rmarkdown     2.25    2023-09-18 [1] CRAN (R 4.2.3)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.2.3)
 rstudioapi    0.15.0  2023-07-07 [1] CRAN (R 4.2.3)
 sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.2.3)
 shiny         1.8.1.1 2024-04-02 [1] CRAN (R 4.2.2)
 stringi       1.7.12  2023-01-11 [1] CRAN (R 4.2.2)
 stringr       1.5.0   2022-12-02 [1] CRAN (R 4.2.2)
 tibble        3.2.1   2023-03-20 [1] CRAN (R 4.2.3)
 urlchecker    1.0.1   2021-11-30 [1] CRAN (R 4.2.3)
 usethis       2.2.3   2024-02-19 [1] CRAN (R 4.2.3)
 utf8          1.2.3   2023-01-31 [1] CRAN (R 4.2.2)
 vctrs         0.6.3   2023-06-14 [1] CRAN (R 4.2.3)
 withr         3.0.0   2024-01-16 [1] CRAN (R 4.2.3)
 xfun          0.40    2023-08-09 [1] CRAN (R 4.2.3)
 xtable        1.8-4   2019-04-21 [1] CRAN (R 4.2.2)
 yaml          2.3.7   2023-01-23 [1] CRAN (R 4.2.2)

 [1] /R/win-library/4.2
 [2] /R/R-4.2.2/library
```
