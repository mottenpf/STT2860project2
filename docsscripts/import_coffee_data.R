
# if (!require("readxl")) install.packages("readxl")
# library(readxl)
# 
# # "C:\Users\Your Mom\Desktop\DataScience"
# 
# coffee <- read_csv("C:\\Users\\Your Mom\\Desktop\\DataScience\\psd_coffee.csv")
# 
# Console output below:
# > coffee <- read_csv("C:/Users/Your Mom/Desktop/DataScience/psd_coffee.csv")
# Error: 'C:/Users/Your Mom/Desktop/DataScience/psd_coffee.csv' does not exist.
# > coffee <- read_csv("C:\Users\Your Mom\Desktop\DataScience\psd_coffee.csv")
# Error: '\U' used without hex digits in character string starting ""C:\U"
# > coffee <- read_csv("C:\\Users\\Your Mom\\Desktop\\DataScience\\psd_coffee.csv")
# Error: 'C:\Users\Your Mom\Desktop\DataScience\psd_coffee.csv' does not exist.
# 
# > Give up trying to import in a reproducible way, manually handle data, again.
# > (had to download to local file thanks to <<expletive deleted>> kaggle api)

# write.csv(x = df, file = "dataraw/streamingcontent.xlsx", row.names = FALSE)

library(readr)
coffee <- read_csv("dataraw/psd_coffee.csv")

glimpse(coffee)

levels(as_factor(coffee$Attribute_Description))


coffee_filter <- coffee %>%
  select("Commodity_Description", "Country_Name", "Calendar_Year", "Month",
         "Attribute_Description", "Unit_Description", "Value") %>%
  filter(
    Attribute_Description != "Beginning Stocks" &
    Attribute_Description != "Ending Stocks" &
    Attribute_Description != "Total Distribution" &
    Attribute_Description != "Total Supply"
  )

glimpse(coffee_filter)
levels(as_factor(coffee_filter$Attribute_Description))

write_rds(
  x = coffee_filter,
  "dataprocessed/coffee.rds"
)
