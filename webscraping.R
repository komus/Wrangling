#Question 3
library(rvest)
library(tidyverse)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
nodes <- html_nodes(h, "table")
tab_1 <- html_table(nodes[[10]])
tab_2 <- html_table(nodes[[19]])
tab_1 <- tab_1[-1]
tab_1 <- tab_1 %>% slice(2:n())%>% setNames(c(X2 ="Team", X3 = "Payroll", X4 = "Average"))

tab_2 <- tab_2 %>% slice(2:n())%>% setNames(c(X2 ="Team", X3 = "Payroll", X4 = "Average"))

dat_full <- full_join(tab_1, tab_2, by = "Team")

#Question 4

url_1 <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h_1 <- read_html(url_1)
tab <- html_nodes(h_1, "table")
read <- html_table(tab[[7]], fill = TRUE)