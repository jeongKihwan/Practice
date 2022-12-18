install.packages("dplyr")

library(dplyr)

exam <- read.csv("D:\\BigData\\R\\r_data\\csv_exam.csv")
exam

# filter ---------------

exam %>% filter(class==1)  # %>% : pipe (ctrl+shift+m)
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(english > 90)
exam %>% filter(english > 90 & class == 3)
exam %>% filter(english > 80 & math > 70)
exam %>% filter(class ==1 | class==2)
exam %>% filter(class %in% c(1,2))

# select --------------------

exam %>% select(math)
exam %>% select(math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class==1) %>%  select(english)
exam %>% select(id, math) %>% head
exam %>% select(id, math) %>% head(10)

# arrange -----------------------

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

# muatate -----------------------

exam %>% mutate(total = math+english+science) %>% head
exam %>% mutate(total = math+english+science,
                mean = (math+english+science)/3) %>% head
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail")) %>% head

# groupby ----------------------------

exam %>% summarise(mean_math = mean(math))
View(exam)

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

# merge ----------------------------

test1 = data.frame(id = c(1,2,3,4,5),
           midterm = c(60,70,83,95,80))
test2 = data.frame(id = c(1,2,3,4,5),
                   final = c(70,83,65,95,100))

test1
test2

total <- left_join(test1, test2, by='id')
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c('kim','lee','park','choi','jung'))
name

exam
name

exam_new <- left_join(exam, name, by='class')
exam_new


# concat -----------------------------

group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_a

group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(60,80,70,90,85))
group_b

group_all <- bind_rows(group_a, group_b)
group_all

#












































