## 2019_10_18.R
## ��Ű�� ��ġ�� �־� �˾ƾ� �� �͵�.
## miniCRAN, match

## �Ϲ������� cran Ȩ�������� ������ ��Ű���� ���� �⺻���� ������ �� �ִ�.

## Import.
#  Imports �±״� ������ ��Ű���� Imports �±׿� ���� ��Ű������ ������ �۵��� ���� ������ �ǹ�.

## Suggests.
#  Suggests�� ���� ��Ű������ ������ ������, ��Ű���� �ֿ� ����� �����ϴµ����� �̻��� ���� ��Ű��.

## Version.
#  �ش� ��Ű���� ������ �ǹ�

## Built
#  �ش� ��Ű���� ���۵��� ���� R version ȯ���� �ǹ�

# ����.
# ���� ��ġ�Ǿ� �ִ� ��Ű���� Ȯ���ؼ� package, Import, Depends, Version �÷��� �����غ���.
packInfo   <- data.frame(installed.packages())
packInfoEx <- packInfo[,c("Package", "Imports", "Depends", "Version")]

strUdfName <- "packInfo"
strUdfDir  <-  "./"
assign(strUdfName, packInfoEx, pos = 1)
save(list = strUdfName, file = paste0(strUdfDir, "/", strUdfName, ".RData"))


## match function
#  match �Լ��� ù ��° �ִ� �μ��� �� ��° �ִ� �μ��� ��� ��ġ�ϴ��� �˷���. 


## miniCRAN package
# miniCRAN�� Local ����� R Package ��ġ�� �����ִ� Package 
# �Ϲ����� Package�� Source�� �����ϴ� ���� �ƴ� �ش� Package�� Dependency���� �ڵ����� ȹ���Ͽ� Repo�� �����ϸ� 
# �ش� Repo�� ���� Info������ ���� �� �����Ѵ�.

install.packages("miniCRAN")

revolution <- c(CRAN="http://cran.revolutionanalytics.com")
pkgs       <- c("foreach")
pkgList <- pkgDep(pkgs, repos=revolution, type="source")