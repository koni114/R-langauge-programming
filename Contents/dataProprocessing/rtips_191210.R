##########
## ���� ##
##########
# 1. �������� dataFrame�� ����Ʈ�� ���� 
# 2. list�� �ִ� ��ü slicing �ϱ� 
# 3.  ���ڿ��� Ư�� ���̷� �����, �� �ڸ��� '0'���� ä��� ���
# 4. �Ҽ� �ڸ� ���� �������ֱ�
# 5.  JSON data -> RDataframe ���·� ���� : jsonlite package : fromJSON

# 1. �������� dataFrame�� ����Ʈ�� ���� ----
# 1.1. R environment ���� �����ϴ� ���� ���� DataFrame �߿��� Ư�� ������ �����ϴ� DataFrame�� ���� : ls(pattern = "xx") 
# 1.2. �ϳ��� List�� ���� ��� : mget()
# 1.3. List�� ���� Ư�� DataFrame�� Indexing �ϴ� ��� : list[[1]], list[["name"]]

install.packages('curl')
library(data.table)
library(jsonlite)
library(curl)
library(dplyr)

getwd()
rm(list = ls())  # Environment �� �ִ� data ���� ���ɾ�.
cat("\014")  # console �� �ִ� �۱� ���� ���ɾ�.

# dataFrame ���� : ���� ������ ���� DF ����
data_1 <- data.frame(var1 = c(1, 2), var2 = c(3, 4))
data_2 <- data.frame(var1 = c('a', 'b'), var2 = c('c', 'd'))
data_3 <- data.frame(var1 = c(TRUE, TRUE), var2 = c(FALSE, TRUE))
file_1 <- data.frame(var1 = c(1, 2), var2 = c(3, 4))
file_2 <- data.frame(var1 = c('a', 'b'), var2 = c('c', 'd'))
file_3 <- data.frame(var1 = c(TRUE, TRUE), var2 = c(FALSE, TRUE))

# environment �� ������ ��ü Ȯ�� : ls() ----
ls()

# Ư�� ���ڿ��� ������ environment ��ü Ȯ�� ----
ls(pattern = "data_")

# Ư�� ���ڿ�(ex) data_ )�� ������ DF ��ü�� list�� ���� : mget() ----
mget.data_ <- mget(ls(pattern = "data_"))
mget.file_ <- mget(ls(pattern = "file_"))

# list�� �ִ� ��ü slicing �ϱ� ----
mget.data_[[1]]
mget.data_[["data_1"]]

# 2. ���ڿ��� Ư�� ���̷� �����, �� �ڸ��� '0'���� ä��� ��� : sprintf {base}
# �����Ͱ� Ư�� �������� �����Ǿ� ���� ��, �ַ� ���

# dataFrame �����
df <- data.frame(var1 = c(1, 11, 111, 1111))

# sprintf �� �̿��Ͽ� �� �ڸ����� 0 ä��� : �̶� factor type���� ��ȯ
# ex) sprintf("%01d", var1) : 1�ڸ��� ���ڿ��� �����, 1�ڸ����� ���� ������ 0���� ä��.
#    -> �� �� 1�ڸ������� ũ��, ������� ����

df <- transform(df,
                var1_01d = sprintf("%01d", var1),
                var1_02d = sprintf("%02d", var1),
                var1_03d = sprintf("%03d", var1)
)

# ** ����! : data type �� factor ������ ��ȯ �� 
class(df[,2]) # factor�� ��ȯ

# 3. �Ҽ� �ڸ� ���� �������ֱ� ----
# 3.1. �Ҽ��� �ڸ��� ���� : sprintf(".5f", var) ----
e <- c(3.141592)
sprintf("%.1f", e)  # �Ҽ��� 1°�ڸ� ������ ����
sprintf("%.2f", e)  # �Ҽ��� 2°�ڸ� ������ ����

# 3.2. ���� �ڸ��� ���� : sprint("1.1f", e) ----
sprintf("%1.1f", e)
sprintf("%10.1f", e)  # ���� �ڸ����� ���� ���� Ȯ�� -> ���� �κ� : 10�ڸ�

# 4. ��뷮 ������ ������ �о���� ��� : fread() ----
library(data.table)

var1 <- rnorm(n = 1000000, mean = 1)
var2 <- rnorm(n = 1000000, mean = 2)
df.test <- data.frame(var1 = var1, var2 = var2)

write.table(df.test, file = "test.txt")

# system.time function�� �̿��� �ð� ���� ��, �ξ� ������ Ȯ�� ����
# fread() �� ȣ�� ��, data.table, data.frame type ���� ����

system.time(test2 <- read.table(file = "test.txt",
                                header = TRUE,
                                stringsAsFactors = F
            ))

system.time(test3 <- fread("test.txt",
                           header = TRUE,
                           stringsAsFactors = F
                           ))

# 5. JSON data -> RDataframe ���·� ���� : jsonlite package : fromJSON ----
# JSON Data ������ data ȣ��

library(jsonlite)  # jsonlite library ȣ��(package�� ���ٸ�, ��ġ)
df_repos <- fromJSON("https://api.github.com/users/hadley/repos")  # fromJSON �Լ��� �̿��Ͽ� RDataFrame �� ����
head(df_repos)  # �� ������� Ȯ��

# 6. '#' �� ���� Ư�� ���ڰ� �����ִ� ���ڸ� �������� ���� ��, comment.char = "" ----
# read.table, read.csv �� file�� ������ ��, parameter �� comment.char = "" �� �־��ָ� ��

