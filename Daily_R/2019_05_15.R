# group ���� ���� ���� ó�� 
with(df1, ave(v1, ID, FUN = function(x)
  replace(x, is.na(x), x[!is.na(x)][1L])))

# ave function
# �׷캰�� ����� �Լ��� �����ϴ� �Լ�
# ave(x, ��, FUN = mean)

# ���� ���� 
# ����ġ ó����, �׷� ��պ��� ���� ������ ��ü�ϰ� ���� ��,
# structure function�� �̿��Ͽ� data.frame�� ������� ����
df <- structure(list(ID = c("A", "A", "A", "B", "B", "B", "C", "C","C")
                     , v1 = c(1L, NA, NA, NA, 2L, NA, NA, NA, NA))
                , .Names = c("ID",  "v1"), class = "data.frame", row.names = c(NA, -9L))


df[,"v1"] <- ave(df[,"v1"], df[,grpVar], FUN = function(x){
  impute(x, mean(x, na.rm = T))
})

# replace function
# replace(���͸�, list=������ ������ �ε���, values=������ ��)