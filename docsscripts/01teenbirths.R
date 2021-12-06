# read in CDC teen births data and write to Rdata format
# created: 2021-10-27
# updated: 2021-10-27

library(tidyverse)
library(readxl)

# source https://www.cdc.gov/nchs/data-visualization/county-teen-births/index.htm

saveRDS(read_excel("dataraw/CDCteenbirthrates20032018.xlsx", 
                   sheet = 1,
                   skip = 1,
                   col_names = c("year",
                                 "state",
                                 "county",
                                 "stateFIPS",
                                 "countyFIPS",
                                 "FIPS",
                                 "birth_rate",
                                 "LCL",
                                 "UCL")),
        file = "dataprocessed/CDCteenbirthrate.rds")

