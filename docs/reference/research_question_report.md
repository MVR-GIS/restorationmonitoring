# Render a self-contained research question HTML report

Render a self-contained research question HTML report

## Usage

``` r
research_question_report(summary, output_file, template_dir = NULL)
```

## Arguments

- summary:

  Output of research_question_summary().

- output_file:

  New HTML destination in an existing local directory.

- template_dir:

  Source checkout's inst/reports directory. When NULL, use the installed
  restorationmonitoring package's report resources.

## Value

Normalized report path invisibly. Existing snapshots are never replaced.

## Details

The current template is specific to the Steamboat Island mussel pilot
and expects the associated reviewed worksheet structure. It is not a
general report for arbitrary projects.
