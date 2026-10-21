# R package development

## Applicable evidence

- Package metadata and dependencies: `DESCRIPTION`
- Exported interface: `NAMESPACE`, roxygen source, and generated `man/`
- Implementation: `R/`
- Behavioral verification: `tests/testthat/`
- User guidance: `README.Rmd`, vignettes, and pkgdown configuration

## Procedure

1. Inspect `DESCRIPTION`, `NAMESPACE`, relevant R functions, tests, and documentation.
2. Keep exported behavior, roxygen comments, generated help, examples, and tests aligned.
3. Prefer deterministic functions with structured return values for automation.
4. Run focused `testthat` tests, regenerate documentation when needed, then run package-level checks.
5. Review generated-file changes separately from hand-authored source changes.

For document processing and scientific reporting, follow [the R-centered document workflow](document-processing.md). Current source-development functions can be exercised before package metadata exists; do not describe those checks as an installed-package or R CMD check result.
