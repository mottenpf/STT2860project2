# converts the strmtv.rds dataset into a different (long) format
# writes the new dataset to an .rds file in the processed folder
 if(!require("cgwtools")){install.packages("cgwtools")}

# read in the strmtv.rds data file

strmtv <- readRDS("dataraw/strmtv.rds")


# enter the filename and pivot the file into into a long format

strmtv_long <- pivot_longer(strmtv,
  cols = c(Netflix, Hulu, `Prime Video`, `Disney+`),
  names_to = "Service",
  values_to = "YesNo"
) %>%
  filter(YesNo == 1)

glimpse(strmtv_long)
# write strmtv_long to an .rds file

write_rds(
  x = strmtv_long,
  "dataprocessed/strmtv_long.rds"
)

# add strmtv_long to streamingcontent.Rdata

cgwtools::resave(strmtv_long, file = "dataprocessed/streamingcontent.Rdata")

