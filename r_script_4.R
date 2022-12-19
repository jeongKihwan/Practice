install.packages("foreign")
install.packages("readxl")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

getwd()

# "Koweps_hpc10_2015_beta1.sav"

raw_welfare <- read.spss(file= 'Koweps_hpc10_2015_beta1.sav',
                         to.data.frame = T)
raw_welfare
View(raw_welfare)

head(welfare)
tail(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare, 
       sex = h10_g3,
       birth = h10_g4,
       marriage = h10_g10,
       religion = h10_g11,
       income = p1002_8aq1,
       code_job = h10_eco9,
       code_region = h10_reg7)

welfare <- welfare %>% select(sex, birth, marriage, religion, income, code_job,
                   code_region)

head(welfare)

welfare$sex
class(welfare$sex)
table(welfare$sex)  # value_counts()

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

is.na(welfare$sex)

table(is.na(welfare$sex))

welfare$sex <- ifelse(welfare$sex ==1, 'male', 'female')
table(welfare$sex)
qplot(welfare$sex)

# ----------------------------------------

welfare$income
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

table(welfare$income)
welfare$income

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$incom)

is.na(welfare$income)
table(is.na(welfare$income))

# na값을 제외한 성별 평균소득
sex_income <-  welfare %>%   # ctrl+shift+m
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()

# -----------------------------------------

class(welfare$birth)
welfare$birth
summary(welfare$birth)  # describe()
qplot(welfare$birth)

is.na(welfare$birth)
table(is.na(welfare$birth))  # na 없음

welfare$birth <- ifelse(welfare$birth > 2021, NA, welfare$birth)
table(is.na(welfare$birth))

names(welfare)

welfare$age <- 2021 - welfare$birth + 1
summary(welfare)

# 연령별 평균 소득

age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))

age_income

ggplot(data = age_income, aes(x=age, y=mean_income)) + geom_line()

welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, 'young', 
                       ifelse(age <= 59, "middle", "old")))

welfare

ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))

ageg_income

ggplot(data=ageg_income, aes(x=ageg, y=mean_income)) + 
  geom_col()

# ----------------------------------------

sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income, aes(x=ageg, y=mean_income)) + 
  geom_col()

ggplot(data=sex_income, aes(x=ageg, y=mean_income, 
                            fill=sex)) +  geom_col()

names(welfare)

welfare$code_job

getwd()

# 직종별 평균소득---------------------------------

library(readxl)

list_job <- read_excel("Koweps_Codebook.xlsx", sheet=2, 
                       col_names = T)
head(list_job)

head(welfare)

welfare <- left_join(welfare, list_job, id='code_job')
head(welfare)

job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

job_income

top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10) 
top10 

bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)
bottom10

# religion -----------------------------

names(welfare)
welfare$marriage
welfare$religion

welfare$group_marriage <- ifelse(welfare$marriage ==1, 'marriage',
                           ifelse(welfare$marriage ==3, "divorce", NA))
welfare$group_marriage
table(welfare$group_marriage)

head(welfare)

religion_marriage <- welfare  %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage














