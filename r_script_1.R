# R 설치
# R studio 설치

print('hello R')
love <- 'hello R'
print(love)  # 변수 'love'출력

# R -  대소문자 구문함..
Print('hello R')

love <- 1  # '<-' 대입연산자 : '='
print(love)

love <- "안녕하세요"
print(love)

love = 'hello R'
print(love)

love <- print
love('hello world')

love_num <- 1
love_str <- '안녕하세요'
love_vec <- c(1,2,3,4)   # vector
love_func <- print

# str : 객체의 정보 출력, 데이터타입 확인
str(love_num)  # num
str(love_str)  # chr
str(love_vec)  # [1:4]
str(love_func)  # function


# ==================================
# vect : 1차원 array vector => c
# ==================================


vec_t = c(1,2,3,4)
vec_t

str(vec_t)

length(vec_t)  # len

vec_t <- c(1, 'hi', 2)  # vector는 동일한 데이터타입을 원소로 갖음
vec_t

scalar_item <- 1
vector_item <- c(1)

scalar_item
vector_item

# 한 개의 문자나 숫자도 원소 한 개의 vector로 취급..
identical(scalar_item, vector_item)  # 값이 동일한지 판단..

str(scalar_item)
str(vector_item)

mode(scalar_item)
mode(vector_item)

str(1)
str(c(1))

numeric_vector <- c(0.2, -1.2, -0.5)
numeric_vector

str(numeric_vector)

n_vector <- c(1,2,3,4,5,6,7,8)

min(n_vector)
max(n_vector)
mean(n_vector)
median(n_vector)  # 중앙값
sum(n_vector)

numeric_vector <- c(1/0, 2/2, -2/2, -1/0, 0/0)
numeric_vector

# True, False

ex_logical_1 <- c(TRUE, FALSE, TRUE, FALSE)
ex_logical_1

mode(ex_logical_1)

!ex_logical_1

# as.logical() : logical type으로 변경, 0이 아니면 TRUE, 0이면 FALSE 
as.logical(c(0, -1, 1, 100, -7))

# as.numeric() : numeric type으로 변경, TRUE면 1, FALSE면 0
as.numeric(ex_logical_1)


v_character <- c("문자열", "문자열1", "A", "1")
v_character

mode(v_character)

v_character <- c('f134', 'f125', 'f345', 'f224')
length(v_character)

nchar(v_character)

substr("1234567", 2,4)  # 문자열의 2~4번째 요소를 출력

substr(v_character, 2, 4) # 벡터 안의 문자열의 2~4번째 요소를 출력

strsplit('2014/11/22', split="/")

paste("50", "30", "20", sep='*')  # => '*'.join(["50", "30", "20"])

toupper("sdjkjJLJLjfdlLJL")
tolower("sdjkjJLJLjfdlLJL")


# factor : category datatype (범주형 데이터)
#          category에 해당하는 값만 추가가 가능
v_character <- c('사과','복숭아','사과','오렌지','사과','오렌지','복숭아')
v_character

v_factor = factor(v_character)
v_factor

mode(v_factor)  # 문자형식으로 출력되지만, 내부적으로 숫자로 처리..

str(v_factor)

v_factor_to_char = as.character(v_factor)
v_factor_to_char

v_factor_to_num = as.numeric(v_factor)
v_factor_to_num

v_factor <- factor(v_character, levels=c("사과", "복숭아"))
v_factor

# 서열을 나타내는 범주형 데이터
ex_label <- c("하하", "중하", "중", "중상", "상상")

ordered_factor = factor(ex_label, ordered=T)
ordered_factor

ordered_factor = factor(ex_label, levels=c("하하", "중하", 
                          "중", "중상", "상상"), ordered=T)
ordered_factor

# vector datatype 변경

v_num <- c(1000, 2000, 3000, 4000)
v_num

v_num_factor <- factor(v_num)
v_num_factor

v_num_char = as.character(v_num)
v_num_char

v_num_logical = as.logical(v_num)
v_num_logical

v_num_char_num = as.numeric(v_num_char)
v_num_char_num


# vector indexing, slicing

t_vector <- c(11,12,14,15,15,16,16,17,18)
t_vector

t_vector[4]
t_vector[c(2,3,4)]
t_vector[c(3,5,8)]

# 연속값 생성
seq_vector <- 3:7
seq_vector

seq_vector <- 3:30
seq_vector

seq_vector[10:20]

# seq(from=start_num, to=end_num, by=step)
seq(from=10, to=20, by=2)
seq(from=20, to=10, by=-2)
seq(20, 10, -2)

# boolean indexing
logical_idx <- c(F, F, T,F, T)

t_vector <- c(11,12,13,14,15)

t_vector[logical_idx]

t_vector[c(T, T, T, F, F)]

# element wise operation/ broadcasting
t_vector <= 13
t_vector[t_vector <= 13]


# vector 값 변경

vector_m <- c(1,2,3,4,5)
vector_m

vector_m[3]
vector_m[c(2,3,4)]

vector_m[3] <- 10
vector_m

vector_m[c(2,3,4)] <- 10
vector_m

vector_m[3:5] <- 100
vector_m

# vector에 원소 추가

v_add <- c(1,2,3,4,5)

c(0, v_add)
c(v_add, 0)
c(v_add, 2:5)

v_add1 <- c(6,7,8)

v_add
v_add1

new_add <- c(v_add, v_add1)
new_add

new_add <- c(v_add, v_add1, 3:5)
new_add


# vector의 원소 삭제..

new_add[-c(1,3)]

new_add[-length(new_add)]

new_add <- new_add[-c(2,5,6)]
new_add

new_add[c(T,T,T,T,F,F,F,F)]

logical_idx = c(T,T,T,T,F,F,F,F)

new_add[logical_idx]
new_add[!logical_idx]

# vector 연산

a <- c(1,2,3,4)
b <- c(5,6,7,8)
c <- c(9,10)
d <- c(11,12,13)

a+b  # element wise operation
a-b

a+c  # broadcasting : shape이 다른 경우
a * 10

a+d  # 길이가 배수가 아니면 연산은 되지만, 경고메시지


# ==============================
# 2차원 DataFrame
# ==============================

id <- c('F1', 'F2', 'F3')
name <- c('김기수','박인호','고소미')
age <- c(32, 28, 22)
isMarried <- c(TRUE, TRUE, FALSE)

df <- data.frame(id, name, age, isMarried)
df

df[2,2]
df[c(2,3), c(2,3)]
df[c(1,2), c(3,4)]
df[, c(2,3)]
df[, c('name', 'age')]

df[c(2,3), ]

df$name

df$age

iris   # iris : 붗꽃데이터

str(iris)
# iris$Species

nrow(iris)
ncol(iris)

head(iris)
tail(iris)

summary(iris)  # pandas : describe

iris$Sepal.Length
iris$Petal.Width

min(iris$Sepal.Length)
max(iris$Sepal.Length)
mean(iris$Sepal.Length)
sum(iris$Sepal.Length)
median(iris$Sepal.Length)

View(iris)

# Sepal.Length가 7보다 큰 데이터를 조회
# subset(dataframe, 조건, 출력할 칼럼명..)

subset(iris, Sepal.Length > 7)
subset(iris, Sepal.Length > 7 & Petal.Length < 6) # "&" : and조건(동시만족)
subset(iris, Sepal.Length > 7 | Petal.Length < 6) # "|" : or조건 (일부만족)
subset(iris, Sepal.Length > 7 & Petal.Length < 6,  c(4,5))
subset(iris, Sepal.Length > 7 & Petal.Length < 6, c('Petal.Length', 'Species'))
subset(iris, Species == "virginica")


name <- c('김기수','박인호','고소미','이기성')
age <- c(23,28,15,22)
weight <- c(67,75,73,80)

df <- data.frame(name, age, weight)
df

# daframe의 indexing ,slicing
# => df[행(row), 열(column)]

df[,]    # 모든 행과 모든 열을 선택
df[c('1','2'), c('name', 'weight')]
df[c(1,2), c(1,3)]
df[c(T,F,T,F), c(T,F,T)]

df$name

# 나이가 20세 이상인 데이터만 출력
df$age >= 20
df[df$age >= 20, ]


# longley
longley   # 미국 경제지표가 들어있는 객체 - dataframe

longley$GNP > 200
longley$Population >= 109
longley$Year > 1950
longley$Employed > 62

l_idx = longley$GNP > 200 & longley$Population >= 109 & longley$Year > 1950 & longley$Employed > 62
l_idx

longley[l_idx, ]  # row는 boolean indexing, column은 전체 column선택


# sqldf -  dataframe을 sql 명령으로 수행..

install.packages("sqldf")  # sqldf 패키지 설치
library(sqldf)  # sqldf 패키지 로드

sqldf("select GNP, Year, Employed from longley")
sqldf("select GNP, Year, Employed from longley where GNP > 400")
sqldf("select * from longley where Year >= 1960")

# order : 정렬
df$age
order(df$age)  # 오름차순 정렬한 값의 순서 index
df[order(df$age), ]  # 정렬된 데이터의 순서index를 실제 데이터의 인덱스로 넣는다..
df[order(df$age, decreasing = TRUE), ]

sort(df$age)  # 데이터를 정렬해서 정렬된 데이터를 리턴..
sort(df$age, decreasing = TRUE)


# groupby

dept <- c('개발부','개발부','개발부','개발부','영업부','영업부','영업부','영업부')
position <- c('과장','과장','차장','차장','과장','과장','차장','차장')
name <- c('김가윤','고동산','박기성','이소균','황가인','최유리','김재석','유상균')
salary <- c(5400,5100,7500,7300,4900,5500,6000,6700)
worktime <- c(15,18,10,12,17,20,8,9)

com_data = data.frame(dept, position, name, salary, worktime)
com_data

# 부서별 급여 평균
# aggregate(계산할 칼럼 ~ 그룹핑할 칼럼, dataframe, 함수)
aggregate(salary ~ dept, com_data, mean)

# 부서별 급여 및 근무시간 평균
aggregate(cbind(salary, worktime) ~ dept, com_data, mean)

# 직급별 급여 평균
aggregate(salary ~ position, com_data, mean)

# 직급 및 부서별 급여 평균..
aggregate(salary ~ dept + position, com_data, mean)

# ------------- dataframe 수정

com_data

com_data[2, 2] <- '차장'
com_data

com_data = edit(com_data)
com_data

com_data[com_data$position == '차장', ]

com_data[com_data$position == '차장', ]$salary <- 8000
com_data

# column 추가
com_data$new_col <- '신규'
com_data

# column 삭제
com_data$new_col <- NULL
com_data

com_data[, c(1,3)] <- NULL
com_data

iris$Petal.Length <- NULL
iris$Petal.Width <- NULL
iris

# column 이름 바꾸기 : colnames
colnames(iris)

colnames(iris) <- c('꽃잎길이', '꽃잎넓이', "붓꽃종류")
colnames(iris)


# concat / merge

id <- c('F1', 'F2', 'F3', 'F4')
name <- c('김기수','박인호','고소미','이승철')
age <- c(32, 28, 22, 40)

ex_df_age <- data.frame(id, name, age)
ex_df_age

id <- c('F1', 'F2', 'F3', 'F4')
name <- c('김기수','박인호','고소미','이승철')
score <- c(95, 100, 56, 73)

ex_df_score <- data.frame(id, name, score)
ex_df_score

id <- c('C1', 'C2')
name <- c('김수미','박남정')
age <- c(95, 100)

ex_df_add <- data.frame(id, name, age)
ex_df_add


# concat

cbind(ex_df_age, ex_df_score)
# rbind(ex_df_age, ex_df_score) 
rbind(ex_df_age, ex_df_add)

# merge
merge(ex_df_age, ex_df_score, by=c('id', 'name'))

merge(ex_df_age, ex_df_score, by=c('id'))


# List ---------

# list : 대부분의 객체를 리스트의 요소로 담을 수 있다.
# vector: 동일한 데이터타입의 데이터만 요소로 담을 수 있다.
# factor : 범주 내에 포함되는 데이터만 요소로 담을 수 있다..

vt_1 <- c(1,2,3,4,5)
vt_2 <- c(T,F,T,F,T,F)
df_1 <- data.frame(name=c('Alice','James','Merry'), age=c(25,35,14))

var_list = list(vt_1, vt_2, df_1, sum)
var_list

var_list = list(v1=vt_1, v2= vt_2, v3= df_1, v4 = sum)
var_list

names(var_list)
length(var_list)
str(var_list)

var_list[1]
var_list['v1']

var_list[3]
var_list[['v3']]

var_list[4]
var_list[[4]](c(1,2,4,5,6))

var_list$v4(c(1,2,4,5,6))

var_list[['v1']] <- NULL
var_list

korea_temp = list(경기 = c(-10, 2, 1, -2), 강원 =c(0, -4, -5, -10))
korea_temp

# lapply(list name, function name) : list의 요소에 함수를 적용한 값 리턴
# => 리스트 형태로 값을 리턴
# sapply(list name, function name) : list의 요소에 함수를 적용한 값 리턴
# => 하나의 값으로 리턴

lapply(korea_temp, mean) 
sapply(korea_temp, mean)

mode(lapply(korea_temp, mean) )
mode(sapply(korea_temp, mean))


# for
# if
# function
# data 입출력
12

