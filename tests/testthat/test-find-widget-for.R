context("widget finders")

test_that("widget_for finds widgets", {
    expect_output(print(widget_for("zip")), "works_in_zip")
    expect_output(print(widget_for("zip")), "lives_in_zip")
    expect_is(widget_for("zip"), "data.frame")
})

test_that("widget_for is case insensitive", {
    expect_identical(widget_for("zip"),
                     widget_for("ZIP"))
})

test_that("widget_for has correct behavior when no matches", {
    expect_warning(widget_for("xyz"), "No widget")
})

test_that("show_widgets is a DT datatable", {
    expect_is(show_widgets(), "datatables")
})

test_that("all widgets are represented in widget registry", {
    all_r_files <- list.files(system.file("R", package = "discoveryengine"))
    existing_widgets <- grep("^widget", all_r_files, value = TRUE)
    existing_widgets <- gsub("^widget-", "", existing_widgets)
    existing_widgets <- gsub("\\.R$", "", existing_widgets)

    existing_widgets <- gsub("-", "_", existing_widgets)
    existing_converters <- grep("^converter", all_r_files, value = TRUE)
    existing_converters <- gsub("^converter-", "", existing_converters)
    existing_converters <- gsub("\\.R$", "", existing_converters)
    existing_converters <- gsub("-", "_", existing_converters)

    existing_miners <- grep("^miner", all_r_files, value = TRUE)
    existing_miners <- gsub("^miner-", "", existing_miners)
    existing_miners <- gsub("\\.R$", "", existing_miners)
    existing_miners <- gsub("-", "_", existing_miners)

    existing_widgets <- c(existing_widgets, existing_converters, existing_miners)
    registered_widgets <- widget_for(".*")$widget_name

    not_registered <- setdiff(existing_widgets, registered_widgets)
    nr_msg <- paste("some widgets have not been registered: ",
                    paste(not_registered, collapse = ", "), sep = "")
    expect(length(not_registered) == 0L, nr_msg)

    not_existing <- setdiff(registered_widgets, existing_widgets)
    ne_msg <- paste("some widgets in the registry don't exist: ",
                    paste(not_existing, collapse = ", "), sep = "")
    expect(length(not_existing) == 0L, ne_msg)

    dupes <- registered_widgets[duplicated(registered_widgets)]
    dupe_msg <- paste("these widgets appeared twice in the registry: ",
                      paste(dupes, collapse = ", "), sep = "")
    expect(length(dupes) == 0L, dupe_msg)
})
