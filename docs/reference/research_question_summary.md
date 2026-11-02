# Assemble a research question report from existing extraction worksheets

Assemble a research question report from existing extraction worksheets

## Usage

``` r
research_question_summary(
  question,
  science_file,
  restoration_file,
  entities = data.frame(),
  priorities_file = NULL,
  priorities_source = NULL,
  priority_links_file = NULL,
  study_instance_file = NULL
)
```

## Arguments

- question:

  One analyst-supplied research question, labelled as proposed.

- science_file:

  Science worksheet JSON with sources and assertions.

- restoration_file:

  Restoration extraction JSON.

- entities:

  Optional data frame of candidate conceptual distinctions.

- priorities_file:

  Optional reviewed workshop-priority register JSON.

- priorities_source:

  Original workbook corresponding to that register.

- priority_links_file:

  Optional explicit pilot relevance links JSON.

- study_instance_file:

  Optional source-located scientific instance JSON.

## Value

A read-only report summary with source fingerprints and derivation
links.
