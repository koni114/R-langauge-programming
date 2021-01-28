## 2019_08_22
## ggplot2 densitiy plot ���� ���
## �ֺ����� �϶��� �ؼ��� ã�� ��� : optimizer, kmeans algorithm �̿�

# 1. ggplot2 densitiy plot ----

# density Plot in R
rm(list = ls())

library(datasets)
library(ggplot2)
data(airquality)

# 1. �⺻ density plot ����
# geom_density() function ���
p8 <-ggplot(airquality, aes(x = Ozone)) +
  geom_density()
p8

# 2. axis label �߰�
# scale_x_continuous function �� name param ���
# scale_y_continuous function �� name param ���
# �� �ٲٰ� ������ \n ���

p8 <- p8 + scale_x_continuous(name = "Mean ozone in parts per billon") +
  scale_y_continuous(name = 'Density')
p8

# 3. ���� scale �ٲٱ�
# breaks : �࿡���� ������ �ǹ�. �Ϲ������� Data�� �ִ� �ּ��� Ư�� ������ �Է��Ͽ� ���
# limits : �࿡���� scale �ִ� �ּ�. 
# ** �ΰ��� ���� �� �Է��ؾ� �������� �е� �Լ��� ����.

p8 <- p8 + scale_x_continuous(name   = "Mean ozone in\nparts per billion",
                              breaks = seq(0, 200, 25),
                              limits = c(0, 200))

# 4. title
# �׷��������� title�� �ſ� �߿�.

p8 <- p8 + ggtitle("Density plot of mean ozone")
p8

# 5. ����, ���� �ٲٱ�
# fill  : �е� �Լ� �� ä������ ����
# line  : �� ��
# alpha : ���� ** �ִ°� �Ϲ������� ����
fill <- "#4271AE"
line <- "#1F3552"
alpha = 0.6 

p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line, alpha = 0.6) + 
  scale_x_continuous(name   = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25),
                     limits = c(0, 200)) +
  scale_y_continuous(name = "Density") + 
  ggtitle("Density plot of mean ozone")


# 6. ���������� 
# theme_bw() : ������� ���� ��

p8 <- p8 + theme_bw()
p8

# 7. �ڽ� �׸��� �׷��� ����� **
# ��Ȯ���� �𸣰�����, panel ���� �̿��Ͽ� �ڽ� �׸��� �׷����� ���� �� ����.

library(grid)

fill  <- "#4271AE"
lines <- "#1F3552"

p8 <- ggplot(airquality, aes(x = Ozone)) + 
  geom_density(colour = lines, fill = fill, size = 1) +
  scale_x_continuous(name = "Mean ozone in \n parts per billion",
                     breaks = seq(0, 200, 25),
                     limits = c(0, 200)
  ) +
  ggtitle("Density plot of mean ozone") +
  theme_bw() +
  theme(axis.line = element_line(size = 1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border     = element_blank(), panel.background = element_blank(),
        plot.title       = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9),
        axis.text.y=element_text(colour="black", size = 9))
p8

# 8. ���� �߰��ϱ� **
p8 <- p8 + geom_vline(xintercept = c(75, 135), size = 1, colour = "#FF3721",
                      linetype = "dashed"
)
p8


## �������� ������ �ֺ� �츮 �����϶��� �ؼ��� ã��! **
# �Ϲ������� �����Ͱ� two classes �� ���� �ϰ� �������� �ִ�. (���� �з� �����ʹ� �ٸ��� �ν�����)

# bimodal distribution�� ������ data �϶�,
mm <- c(418, 527, 540, 553, 554, 558, 613, 630, 634, 636, 645
        , 648, 708, 714, 715, 725, 806, 807, 822, 823, 836, 837
        , 855, 903, 908, 910, 911, 913, 915, 923, 935, 945, 955
        , 957, 958, 1003, 1006, 1015, 1021, 1021, 1022, 1034, 1043
        , 1048, 1051, 1054, 1058, 1100, 1102, 1103, 1117, 1125, 1134
        , 1138, 1145, 1146, 1150, 1152, 1210, 1211, 1213, 1223, 1226, 1334)

mm2 < c(1,2,3,3,3,5,8,12,12,12,12,18)

min_mm2 <- min(mm2, na.rm = T)
max_mm2 <- max(mm2, na.rm = T)

bimodal_df = data.frame(exp1 = mm2)



p8 <- ggplot(bimodal_df, aes(x = exp1)) + 
  geom_density(colour = lines, fill = fill, size = 1) +
  scale_x_continuous(name = "bimodal distribution",
                     breaks = seq(418, 1334, 10),
                     limits = c(418, 1334)
  )
p8

# �� �����͸� �е� �Լ��� ��ȯ�� �� �ִµ�,
# �е� �Լ��� ��ȯ ���� ���� x, y �� �̿�����.

d <- density(bimodal_df$exp)

# ��������� �ؼ����� ���ϴ� ���ε�, dy/dx = 0�� ���ϴ� ����
# �е��Լ��� x �� ������ �����ϹǷ�, diff(d$y) �� ���밪�� �ּҰ� �Ǵ� ���� ã��.
# ����ϸ� ������ ����.

d$x[which.min(abs(diff(d$y)))]

# ������, �ش����� �̺� ���� 0�� �ǹǷ�, ���� ���� ���� �ؼҰ�����, �ش밪���� �˱� ��ƴ�.
# ���� optimize �Լ��� �̿��ؼ�, �ؼ����� ã�� �� �ִ�.

check <- optimize(approxfun(d$x,d$y),interval=c(min_mm2, max_mm2))$minimum
p8    <- p8 + geom_vline(xintercept = check, size = 1, colour = "#FF3721", linetype = "dashed")
p8

# 2. k-means Ŭ�����͸��� �̿��� ���

mm <- c(418, 527, 540, 553, 554, 558, 613, 630, 634, 636, 645
        , 648, 708, 714, 715, 725, 806, 807, 822, 823, 836, 837
        , 855, 903, 908, 910, 911, 913, 915, 923, 935, 945, 955
        , 957, 958, 1003, 1006, 1015, 1021, 1021, 1022, 1034, 1043
        , 1048, 1051, 1054, 1058, 1100, 1102, 1103, 1117, 1125, 1134
        , 1138, 1145, 1146, 1150, 1152, 1210, 1211, 1213, 1223, 1226, 1334)

bimodal_df       <- data.frame(exp1 = mm)
d                <- density(bimodal_df$exp1)
km               <- kmeans(bimodal_df$exp1, centers = 2)

bimodal_df$clust <- km$cluster

unique(bimodal_df$clust)

summary1 <- bimodal_df %>% filter(clust == 1) %>% summarise(mean = mean(exp1),
                                                            max  = max(exp1),
                                                            min  = min(exp1)
)

summary2 <- bimodal_df %>% filter(clust == 2)  %>% summarise(mean = mean(exp1),
                                                             max  = max(exp1),
                                                             min  = min(exp1)
)

if(summary1$mean < summary2$mean ){
  check <- mean(summary1$max,  summary2$min)
}else{
  check <- mean(summary1$min,  summary2$max)
}


p8 <- ggplot(bimodal_df, aes(x = exp1)) + 
  geom_density(colour = lines, fill = fill, size = 1) +
  scale_x_continuous(name = "bimodal distribution",
                     breaks = seq(418, 1334, 10),
                     limits = c(418, 1334)
  )

p8 <- p8 + geom_vline(xintercept = check, size = 1, colour = "#FF3721",
                      linetype = "dashed"
)

p8