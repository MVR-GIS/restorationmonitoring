test_that("three starting views share the same bounded evidence and original links", {
  graph <- restorationmonitoring:::.rm_bertom_evidence()
  views <- lapply(c("question", "survey", "project"), function(start)
    restorationmonitoring:::.rm_evidence_view(graph, start))
  expected <- setdiff(graph$nodes$id, "assessment")
  for (view in views) {
    expect_setequal(view$nodes$id, expected)
    expect_setequal(view$edges$id, paste0("L", 1:7))
    expect_false(any(view$nodes$hypothetical))
    expect_equal(view$edges$from[view$edges$id == "L1"], "question")
    expect_equal(view$edges$to[view$edges$id == "L1"], "project")
  }
  expect_equal(views[[2]]$nodes$path[views[[2]]$nodes$id == "survey"], "")
  expect_match(views[[2]]$nodes$path[views[[2]]$nodes$id == "question"], "L1")
})

test_that("hypothetical assessment is opt-in and is never presented as actual", {
  graph <- restorationmonitoring:::.rm_bertom_evidence()
  actual <- restorationmonitoring:::.rm_evidence_view(graph, "project")
  example <- restorationmonitoring:::.rm_evidence_view(graph, "project", TRUE)
  expect_false("assessment" %in% actual$nodes$id)
  expect_true("assessment" %in% example$nodes$id)
  expect_true(example$nodes$hypothetical[example$nodes$id == "assessment"])
  expect_true(all(example$edges$hypothetical[example$edges$id %in% c("L8", "L9")]))
  expect_match(example$nodes$detail[example$nodes$id == "assessment"], "DESIGN EXAMPLE ONLY")
})

test_that("invalid evidence identities and references fail", {
  graph <- restorationmonitoring:::.rm_bertom_evidence()
  expect_error(restorationmonitoring:::.rm_evidence_view(graph, "missing"), "Unknown")
  expect_error(restorationmonitoring:::.rm_evidence_view(graph, "assessment"), "excluded")
  graph$edges$to[1] <- "missing"
  expect_error(restorationmonitoring:::.rm_evidence_view(graph, "question"), "unknown references")
})
