context("works_in_msa specifications")
source("helpers.R")
library(magrittr)

test_that("works_in_msa meets specifications on standard input", {
    test <- works_in_msa('41860')
    test %>% uses_table("d_bio_address_mv")
    test %>% id_of_type("entity_id")
    test %>% id_field_is("entity_id")

    test %>%
        has_filters(geo_metro_area_code = "41860",
                    addr_type_code = c("B", "I", "N"),
                    contact_type_desc = 'ADDRESS',
                    addr_status_code = c("A", "K"))
})

test_that("works_in_msa meets specifications on no input", {
    works_in_msa() %>%
        has_clause_count(4)
})

