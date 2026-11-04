# Bounded development fixture and traversal; not a production schema or API.
.rm_bertom_evidence <- function() {
  nodes <- data.frame(
    id = c("question", "project", "objective", "channel", "gis", "survey", "finding", "assessment"),
    label = c("WQ-39: channel substrate and habitat", "Bertom and McCartney Lakes project", "Historical mussel-bed objective and target", "Rock habitat channel", "Restoration Features: seven candidate segments", "2014 mussel survey", "Survey report: habitat-channel findings", "Hypothetical assessment: evidence is insufficient"),
    type = c("Research question", "Project", "Objective and historical target", "Described implementation", "GIS records", "Survey", "Source-reported finding", "Hypothetical practitioner assessment"),
    detail = c(
      "How do substrate composition, heterogeneity, and stability influence mussels, other benthic invertebrate, and spawning habitat for fish in channel environments?",
      "UMRRDB snapshot identifies project 65. Its equivalence to an EMMA project identity is not established.",
      "The DPR lists a mussel-bed objective and target of 10 mussels per square yard; the PER identifies a year-50 target. This is not a confirmed EMMA criterion evaluation.",
      "The DPR and survey report describe a roughly 1,500-foot, seven-section fish and mussel rock habitat channel.",
      "Seven revetment records named Rock Habitat Channel Segments 1-7 share project ID 65. Their individual match to survey segments is unverified.",
      "The report describes a survey on 7-9 October 2014 in habitat and comparison areas. The user confirms no EMMA monitoring task was recorded for Bertom.",
      "The report states 40 live mussels representing 11 species were collected in the habitat channel across survey methods; site-level results and methods vary.",
      "DESIGN EXAMPLE ONLY: A future practitioner might assess the available evidence as insufficient to determine target attainment. No practitioner authored or adopted this statement."),
    source = c("Workshop workbook, Ranked by Reach C41; reach ranks 2, 16, 14, 5.",
      "UMRRDB Projects XML, project ID 65; case screen.", "1989 DPR table 4-1 p. 10; 11-year PER addendum table 1 p. 2.",
      "1989 DPR p. 14; 2015 survey report pp. 2-3.", "Restoration Features XML, RESTORATION.Revetment, IDs 6723-6729.",
      "2015 survey report pp. 3-4; user statement about EMMA tasks.", "2015 survey report pp. 7-9.",
      "Hypothetical analyst-created example; no practitioner author or actual decision."),
    source_url = paste0("https://github.com/MVR-GIS/restorationmonitoring/blob/main/", c(
      "dev/goals/workshop-research-priorities.md", "dev/goals/cross-system-case-screen.md",
      "dev/goals/bertom-rock-habitat-linkage-review.md", "dev/goals/bertom-rock-habitat-linkage-review.md",
      "dev/goals/cross-system-case-screen.md", "dev/goals/bertom-rock-habitat-linkage-review.md",
      "dev/goals/bertom-rock-habitat-linkage-review.md", "dev/architecture/durable-assessment-and-decision-model.md")),
    hypothetical = c(rep(FALSE, 7), TRUE), stringsAsFactors = FALSE)
  edges <- data.frame(
    id = paste0("L", seq_len(9)),
    from = c("question", "project", "objective", "channel", "project", "channel", "survey", "assessment", "assessment"),
    to = c("project", "objective", "channel", "gis", "survey", "survey", "finding", "objective", "finding"),
    relation = c("has a workbook mark for", "is a candidate project identity for", "is associated with", "may correspond to", "is a candidate project match for", "is described as survey context for", "is reported to yield", "hypothetically assesses", "hypothetically considers"),
    basis = c("Workbook Upper Impounded D4: x; meaning unspecified. Analyst notes topical relevance; no FWWG selection or original study intent is established.",
      "DPR table 4-1 and FY27 compilation link the historical objective to the named project; identity with UMRRDB project 65 is a candidate.",
      "11-year PER addendum table 1 p. 2 associates the objective with the rock habitat channel.",
      "Names, project number and seven-section descriptions suggest a match; segment geometry and identities have not been reconciled.",
      "The survey report names the Bertom project; correspondence to the UMRRDB snapshot is a candidate identity match.",
      "Survey report pp. 2-4 describes the habitat channel and its sampling; no site-to-GIS-segment crosswalk was verified.",
      "Survey report p. 7 reports the channel totals. Raw data and full analysis inputs were not recovered in this review.",
      "DESIGN EXAMPLE ONLY: no practitioner-authored assessment or target-attainment determination is recorded in this fixture.",
      "DESIGN EXAMPLE ONLY: this hypothetical relationship illustrates how a future assessment might cite a reported finding."),
    state = c("Candidate relevance", "Candidate identity", "Source documented", "Candidate identity", "Candidate identity", "Source documented", "Source documented", "Hypothetical", "Hypothetical"),
    hypothetical = c(rep(FALSE, 7), TRUE, TRUE), stringsAsFactors = FALSE)
  list(nodes = nodes, edges = edges)
}

# Traverse links in either direction while preserving their stated direction.
# One shortest discovery path is presented; all included links remain available.
.rm_evidence_view <- function(graph, start, include_hypothetical = FALSE) {
  nodes <- graph$nodes
  edges <- graph$edges
  if (anyDuplicated(nodes$id) || anyDuplicated(edges$id) ||
      any(!edges$from %in% nodes$id) || any(!edges$to %in% nodes$id))
    stop("Evidence graph has duplicate or unknown references.")
  if (!include_hypothetical) {
    nodes <- nodes[!nodes$hypothetical, , drop = FALSE]
    edges <- edges[!edges$hypothetical & edges$from %in% nodes$id & edges$to %in% nodes$id, , drop = FALSE]
  }
  if (length(start) != 1L || is.na(start) || !start %in% nodes$id) stop("Unknown or excluded starting item.")
  seen <- start; paths <- stats::setNames(list(character()), start); queue <- start
  while (length(queue)) {
    current <- queue[1]; queue <- queue[-1]
    adjacent <- which(edges$from == current | edges$to == current)
    for (i in adjacent) {
      next_id <- if (edges$from[i] == current) edges$to[i] else edges$from[i]
      if (!next_id %in% seen) {
        seen <- c(seen, next_id); queue <- c(queue, next_id)
        paths[[next_id]] <- c(paths[[current]], edges$id[i])
      }
    }
  }
  selected <- nodes[match(seen, nodes$id), , drop = FALSE]
  selected$path <- vapply(seen, function(id) paste(paths[[id]], collapse = " -> "), "")
  links <- edges[edges$from %in% seen & edges$to %in% seen, , drop = FALSE]
  list(start = start, nodes = selected, edges = links)
}
