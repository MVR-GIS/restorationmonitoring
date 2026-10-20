# Shared HTML presentation, independently written around fluvgeo's gt pattern.
.rm_report_table <- function(x) {
  if (!is.data.frame(x) || !nrow(x) || !ncol(x)) {
    cat("<p>No records supplied; absence has not been established.</p>\n")
    return(invisible(NULL))
  }
  # All worksheet strings are plain text, including possible HTML metacharacters.
  x[] <- lapply(x, function(v) if (is.character(v)) as.character(htmltools::htmlEscape(v)) else v)
  tab <- gt::gt(x, rownames_to_stub = FALSE)
  tab <- gt::sub_missing(tab, missing_text = "Not recorded")
  tab <- gt::opt_row_striping(tab)
  tab <- gt::tab_options(tab, table.width = gt::pct(100), table.layout = "auto",
    table.font.size = gt::px(16), data_row.padding = gt::px(8),
    data_row.padding.horizontal = gt::px(14), column_labels.padding = gt::px(8),
    column_labels.background.color = "#e8eff4", row.striping.background_color = "#f5f8fa")
  tab <- gt::tab_style(tab, gt::cell_text(v_align = "top", whitespace = "normal"),
    locations = gt::cells_body())
  cat(knitr::raw_html(paste0('<div class="rm-table-wrap" tabindex="0" role="region" aria-label="Report table; scroll horizontally if needed">',
    gt::as_raw_html(tab, inline_css = FALSE), '</div>')), sep = "\n")
}

.rm_report_derivations <- function(r) {
  e <- r$derivations
  if (!nrow(e)) return(invisible(NULL))
  # Show only supplied derivation links, not a guessed causal or restoration graph.
  ids <- unique(c(e$from, e$to))
  a <- r$assertions[match(ids, r$assertions$id), , drop = FALSE]
  a$x <- ifelse(a$id %in% e$to, 1, 0)
  a$y <- ave(seq_len(nrow(a)), a$x, FUN = function(v) seq_along(v))
  a$label <- paste(a$id, vapply(a$paraphrase, function(s) paste(strwrap(s, 39), collapse = "\n"), ""), sep = "\n")
  e$x <- a$x[match(e$from, a$id)]; e$y <- a$y[match(e$from, a$id)]
  e$xend <- a$x[match(e$to, a$id)]; e$yend <- a$y[match(e$to, a$id)]
  print(ggplot2::ggplot(a, ggplot2::aes(x, y)) +
    ggplot2::geom_segment(data = e, ggplot2::aes(x = x + .2, y = y, xend = xend - .2, yend = yend),
      inherit.aes = FALSE, linetype = "dashed", colour = "#667d83",
      arrow = grid::arrow(length = grid::unit(2, "mm"))) +
    ggplot2::geom_label(ggplot2::aes(label = label, fill = is.na(source_id)), size = 3.6, label.padding = grid::unit(.5, "lines")) +
    ggplot2::scale_fill_manual(values = c("FALSE" = "#eaf4f1", "TRUE" = "#fcf2e3"), guide = "none") +
    ggplot2::scale_x_continuous(limits = c(-.45, 1.45)) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(add = .7)) +
    ggplot2::theme_void())
}
