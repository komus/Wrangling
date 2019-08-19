library(tidyverse)
data("raw_data_research_funding_rates", package = "dslabs")
raw_data_research_funding_rates %>% head
tab <- str_split(raw_data_research_funding_rates, "\n")

s <- c("5'10", "6'1\"", "5'8inches", "5'7.5")
tab <- data.frame(x = s)
extract(data = tab, col = x, into = c("feet", "inches", "decimal"), regex = "(\\d)'(\\d{1,2})(\\.\\d+)?" )
tab


library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[7]] %>% html_table(fill = TRUE)

polls[-1]

#Question 5
col_name <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
polls %>% setNames(col_name)
polls_info <- polls %>% separate(Remain, c("remain1","remain2"), sep = "%")%>% filter(!is.na(remain2))
polls_info

#Question 6

str_remove(polls$Remain, "%")/100
head(polls)

str_re


