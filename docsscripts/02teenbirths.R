# modify teen births data and write to Rdata format
# filter for data from the state of North Carolina
# created: 2021-10-27
# updated: 2021-10-27

library(tidyverse)

saveRDS(readRDS("dataprocessed/CDCteenbirthrate.rds") %>%
          filter(state == "North Carolina") %>% 
          select(-state, -stateFIPS),
        "dataprocessed/CDCteenbirthrateNC.rds")

