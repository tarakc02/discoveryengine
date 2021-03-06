context("ca_gave_to_proposition specifications")
source("helpers.R")
library(magrittr)

test_that("ca_gave_to_proposition meets specifications on standard input", {
    test <- ca_gave_to_proposition(BL20150064, BL20090019)
    test %>% uses_table("ca_campaign")
    test %>% id_of_type("entity_id")
    test %>% id_field_is("entity_id")

    test$rhs %>%
        has_filters(proposition_id = c("BL20150064", "BL20090019"))
})

test_that("ca_gave_to_proposition has working defaults", {
    test <- ca_gave_to_proposition()
    expect_is(test, "listbuilder")
    test %>% uses_table("ca_campaign")
    test %>% id_of_type("entity_id")
    test %>% id_field_is("entity_id")
})
