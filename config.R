# Install R packages required to render this site if not already installed

required_packages <- c(
  "RefManageR",
  "knitr"
)

missing <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing) > 0) {
  install.packages(missing)
}
