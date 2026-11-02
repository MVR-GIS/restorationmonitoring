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

For document processing and scientific reporting, follow [the R-centered document workflow](document-processing.md). The package was scaffolded with `usethis` on 2026-11-02. Use `roxygen2::roxygenise()` for generated namespace and help, `testthat::test_local()` for focused tests, and build/check the source package for installed-package verification. The Bertom driver remains workspace-specific and is not an exported API. Distinguish sourced-script checks from installed-package and R CMD check results.

## Documentation site

`usethis::use_pkgdown()` configured `_pkgdown.yml`. Build locally with `pkgdown::build_site(preview = FALSE)`; pkgdown installs the package into a temporary library by default. Generated `docs/` is tracked in Git for manual GitHub Pages publication, while `.Rbuildignore` excludes it from R package builds. The site uses the README as its home page and includes the exported function reference. README links to repository-only development notes use GitHub URLs so they work from both the repository and the site after those files are committed and pushed.

Review the generated site, including automatically rendered top-level Markdown files, then commit and push `docs/`. In GitHub Pages settings, select deployment from the intended branch's `/docs` folder. The site URL remains unset until the actual Pages address is confirmed; set it in `_pkgdown.yml` when known. Build and publication are manual: do not add GitHub Actions for this workflow. Users install the package from GitHub with `remotes::install_github("MVR-GIS/restorationmonitoring")`.
