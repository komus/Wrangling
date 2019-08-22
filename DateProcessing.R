library(dslabs)
library(lubridate)
library(tidyverse)
library(stringr)
options(digits = 3)    # 3 significant digits
data(brexit_polls)
'Question 3a'
val <- brexit_polls$startdate %>% str_detect("2016-04")
sum(val)



'Question3b'

roll <- round_date(brexit_polls$enddate, "week")
sum( str_detect(roll,"2016-06-12"))

#Question 4

weekday <- weekdays(brexit_polls$enddate)
dats <- data.frame(weekday)
dats %>% group_by(weekday) %>% summarise(days = list(weekday))

#Question 5
data("movielens")
tab1 <- as_datetime(movielens$timestamp)
fin <-data.frame(date = tab1, mon = month(tab1), day = day(tab1), year= year(tab1), hr = hour(tab1), min = minute(tab1), sec = second(tab1))

dats <-fin %>% group_by(hr) %>% tally()

reviews_by_hour <- table(hour(dates))    # count reviews by year
names(which.max(reviews_by_hour))    # name of year with most reviews
 

library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

#question 6
gutenberg_metadata %>% filter(str_detect(title, "Pride and Prejudice")) 

#question 7
gutenberg_works(title == "Pride and Prejudice")

#question 8
words <- gutenberg_download(1342) %>%   unnest_tokens(word,text)
nrow(words)

#Question 9 & 10
final_words <- words %>% filter(!word %in% stop_words$word & !str_detect(word,"\\d+"))
nrow(final_words)

#Question 11
group_word <- final_words %>% group_by(word) %>% summarise(num = n()) %>% arrange(desc(num))
group_word %>% slice(1:1)

app_more <- group_word %>% filter(num > 100)
nrow(app_more)



