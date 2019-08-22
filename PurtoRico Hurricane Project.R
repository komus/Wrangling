library(tidyverse)
library(pdftools)
options(digits = 3)    # report 3 significant digits
##Question 1
fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system("cmd.exe", input = paste("start", fn))
#Question 2
txt <- pdf_text(fn)
#Question 3
x <- str_split(txt[[9]], "\n")
class(x)
length(x)

#Question 4
s <- x[[1]]
class(s)
length(s)

#Question 5
s <- str_trim(s)
s[[1]]

#question 6
header_index <- str_which(s, "2015")[1]

#question 7
tmp <- str_split(s[header_index], "\\s+", simplify = TRUE)
month <- tmp[1]
header <- tmp[-1]

#question 8
tail_index <- str_which(s, "Total")


#question 9
n <- str_count(s, "\\d+")
sum(n == 1)

#question 10
out <- c(1:header_index, which(n==1), tail_index:length(s))
s <- s[-out]
length(s)

#question 11
s <- str_remove_all(s, "[^\\d\\s]") 

#question 12
s_clean <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
tab <- s_clean %>% 
  as_data_frame() %>% 
  setNames(c("day", header)) %>%
  mutate_all(as.numeric)
mean(tab$"2015")

mean(tab$"2016")

mean(tab$"2017"[1:19])

mean(tab$"2017"[20:30])


#question 13
tab <- tab %>% gather(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab

#question 14
tab %>% filter(year < 2018) %>% 
  ggplot(aes(day, deaths, color = year)) +
  geom_line() +
  geom_vline(xintercept = 20) +
  geom_point()