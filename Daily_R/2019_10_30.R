## 2019_10_30.R

## 1. ��ġ������ ��ȯ�������� Ȯ���ϴ� ���.
## package�� �̿��ϸ� �� ���� �͵��� �ֱ� ���ٵ�.. 
## idea : as.numeric function���� �������� ��, ��ġ���� �ƴ� �͵��� NA�� return ��
##        ���� NA�� �ִ� ��� ��ġ������ ��ȯ �� �� �����Ƿ�, �̶��� ���� X, ���� TRUE�� ���� ��ġ������ ��ȯ

test <- (test = c('1', '2', 'b'))
suppressWarnings(all(!is.na(as.numeric(as.character(col)))))

## 2. factor���� vector���� level�� ���� 1, 0 ���� ��ȯ�ϰ� ���� ��,
##    labels param�� ����Ͽ� �����ϸ� levels <-> labels �� mapping���Ѽ� �����͸� ��ȯ ������!

test <- c('a', 'b')
test <- as.factor(test)
test <- factor(test, levels = levels(test), labels = c(0, 1))


## 3. combinat package
## Combination, permuation�� ���� ������ ������ִ� package(�ſ� ����)
## ���� �����Ϸ��� back tracking�� �̿��ؼ� �˰������� ¥�� �ϹǷ�, �ð��� �ɸ��µ� �̸� package�� Ǯ���!
## �Ƹ� permutation, combination, multibinomial ���� return

# install.packages("combinat")
library(combinat)
Xvar <- c('a', 'b', 'c', 'd')    # 
combn(Xvar, 2)                   # nC2 ����� ���� ������ matrix�� return ������!

## 4. ��ȣ�ۿ뿡 ���ؼ� �򰥸��� ����!
#' Logistic Regression : Y : ����, X : ���� + ����, ���������� ���� ��ȣ�ۿ� check 
#' GLM                 : Y : ����, X : ���� + ����, ���������� ���� ��ȣ�ۿ� check
#' ANOVA               : Y : ����, X : ����, ��������(�������� ��������!)�� ���� ��ȣ�ۿ� check
