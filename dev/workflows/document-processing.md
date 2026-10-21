# R centered document processing

Established by user direction on 2026-10-20. Prefer the existing R reporting ecosystem for document processing, extraction, analysis and publication. Do not introduce Python generators when an appropriate R workflow is available. The organizational/scientific design remains separate from presentation.

## Reference pattern

Reviewed [fluvgeo](https://github.com/FluvialGeomorph/fluvgeo) at Git revision `6eaefd4691b037fe104d94ff4e3612f04398e509` on 2026-10-20. Relevant sources: `dev/goals/reporting-intent.md`, `dev/features/study-staging-report.md`, `R/terrain_development_report.R` (renderer sections), `R/study_context_report.R`, `R/report_tables.R`, `inst/reports/study_staging_report.Rmd`, shared CSS, DESCRIPTION and ignore files. This is a focused source review, not a dependency on installing fluvgeo.

Carry forward its separation of reusable summary data, purpose-specific parameterized templates, R render functions and shared presentation helpers. HTML reports are durable scientific review deliverables, with visual orientation, evidence, rationale, qualifications and supporting records. Table readability is part of functional review. The report does not become the scientific approval authority or a database schema merely by presenting a relationship.

fluvgeo's inspected report family uses R Markdown, not a Quarto project. Therefore R Markdown is the initial implementation here. Quarto is an appropriate later authoring option when needed for a book, website or a specific deliverable; reuse the same summaries and presentation helpers rather than create a competing scientific model. This does not require migrating the adjacent Restoration Features Quarto book.

## Source and output ownership

| Location | Responsibility |
| --- | --- |
| `R/` | Read-only summary assembly, input checks, shared gt/ggplot2 presentation and render wrapper |
| `inst/reports/` | Parameterized R Markdown templates and shared CSS, suitable for future package installation |
| `dev/goals/` and other established `dev/` routes | Maintained evidence worksheets, purpose, conceptual analysis and decisions |
| `dev/scripts/` | Reproducible example drivers and focused development checks; no production writes |
| `dev/outputs/` | Ignored generated report snapshots and local qualification outputs |
| External `UMRR/` holdings | Retained source originals, referenced rather than duplicated in the package |

At this date the checkout has the reproducibleai R-package profile but no DESCRIPTION or NAMESPACE. Functions can be sourced for development; they are not installed/exported package APIs. Package metadata, dependency declarations, roxygen documentation, namespacing and package checks belong to later package initialization. Do not invent maintainers or claim R CMD check passed. `.Rbuildignore` excludes development/output paths; `inst/reports` remains available for future package resources.

## Processing stages

1. Retain original documents and stable source/version/locator information. Use R tools such as pdftools for suitable PDF text extraction when needed; visually check tables, figures and image-only pages before treating extracted text as faithful. OCR and complex layouts require explicit qualification. This stage is guidance; a general ingestion/OCR pipeline is not implemented here.
2. Maintain structured evidence with provenance, explicit author claims versus interpretations, scope, uncertainty and review state. Preserve source facts and unknowns; do not infer missing relationships to make the report look complete.
3. Assemble a reusable R summary independently of rendering. Validate referenced identities and input structure. A presentation summary is not a persistence contract.
4. Render the summary through an appropriate template. Use gt for readable tables and ggplot2 for figures; use purpose-specific views over shared inputs. Contain horizontal scrolling instead of shrinking wide inventories or letting the full page overflow. Essential conclusions remain visible without expanding technical details.
5. Publish a distinguishable self-contained HTML snapshot with generation time, input fingerprints, source references and R/package versions. Do not overwrite prior snapshots. Refer to source documents explicitly; embedded HTML assets do not preserve external source PDFs.
6. Inspect the actual generated report and check the affected render/semantic boundaries. Qualify PDF and Word exports separately when needed; HTML success is not evidence of pagination fidelity. Use R Markdown/Quarto export facilities rather than another handwritten layout generator.

## Running the first example

Required R packages: `jsonlite`, `rmarkdown`, `knitr`, `htmltools`, `gt`, `ggplot2`. Use the team's installed R environment; this task did not install or upgrade packages. Pandoc is required. Positron's bundled Quarto includes it. In an R/Positron session it may already be discoverable; otherwise set `RSTUDIO_PANDOC` to the directory containing `pandoc.exe`.

From the repository root:

```r
# Only if Pandoc is not already discoverable; use the local installation path.
Sys.setenv(RSTUDIO_PANDOC = "C:/Users/R1Suser/AppData/Local/Programs/Positron/resources/app/quarto/bin/tools")
source("dev/scripts/mussel-research-report.R")
```

Or run `Rscript dev/scripts/mussel-research-report.R` for an automatically timestamped destination. To select a new destination, use `Rscript dev/scripts/mussel-research-report.R dev/outputs/research-question/new-review.html`. Source scripts from the repo root; reusable functions accept explicit inputs and template location. Existing destinations fail before rendering. Publication uses a non-replacing hard link, following the inspected fluvgeo pattern; a local hard-link-capable filesystem is required. Rendering does not access production systems, alter worksheets or acquire new scientific evidence.

Run `Rscript dev/scripts/check-research-report.R` for focused validation. A lockfile should be produced from the agreed actual team environment when package initialization occurs; no speculative renv lockfile is supplied.

## Initial qualification

### Warning resolution, 2026-10-21

The Steamboat draft contained knitr warning blocks from `gt`/Sass attempting to write to an inaccessible user-profile cache. The renderer now scopes `options(sass.cache=...)` to its temporary render directory, restores the caller's option and removes the temporary cache on exit. Warnings remain enabled. A publication guard rejects HTML containing rendered warning/error blocks; focused checks deliberately inject a warning to verify that no destination is published.

Separate R startup warnings came from inherited `C.UTF-8` locale variables, unsupported by this Windows runtime. For command-line checks, set `LC_ALL`, `LC_CTYPE` and `LANG` to `English_United States.utf8` in the launching PowerShell process before invoking Rscript. This was verified with `Sys.getlocale()` and warning-free checks/rendering under R 4.6.1. Do not change persistent user/machine settings; other operating systems should use their supported locales. Rendering cannot repair warnings already emitted at R process startup.

The MS-03 instance adds a separate source acquisition/inspection script, `dev/scripts/review-mussel-vital-rates.R`. Its maintained manifest preserves URLs and source fingerprints; optional downloads and CSV inspection remain separate from report rendering. Full-paper access and statistical reproduction are not implied by an accessible dataset.

The first example rendered under R 4.6.1 using installed reporting packages and Positron's Pandoc. R emitted locale startup warnings. Focused check results and actual visual inspection are recorded in the [dashboard feature](../features/research-question-dashboard.md); this is not full package qualification. The previous handwritten Python/PDF generator has been retired; its original PDF is retained as a superseded local artifact under ignored development outputs.
