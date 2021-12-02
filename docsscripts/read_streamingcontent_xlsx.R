# reads two datasets from the raw data file streamingcontent.xlsx
# writes the datasets to individual .rds files and an .Rdata file
# original data is in the raw folder, new in the processed folder
if (!require("readxl")) install.packages("readxl")
library(readxl)
dir.create("dataprocessed")

# view the names of the worksheets that are in streamingcontent.xlsx

excel_sheets("dataraw/streamingcontent.xlsx")

# read in the first sheet of streamingcontent.xlsx and name it dplus

dplus <- read_xlsx(
  "dataraw/streamingcontent.xlsx",
  sheet = "disneyplus", 
)
glimpse(dplus)

# read in the second sheet of streamingcontent.xlsx and name it strmtv

strmtv <- read_xlsx(
  "dataraw/streamingcontent.xlsx",
  sheet = "tvshows", 
)
glimpse(strmtv)

# write the datasets to two .rds files named dplus.rds and strmtv.rds

write_rds(
  x = dplus,
  "dataprocessed/dplus.rds",
)
write_rds(
  x = strmtv,
  "dataprocessed/strmtv.rds",
)

# write the datasets to an .Rdata file called streamingcontent.Rdata

save(dplus, strmtv, file = "dataprocessed/streamingcontent.Rdata")
