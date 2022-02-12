install.packages("pacman") # run this only once if you do not have pacman package

pacman::p_load(tidyverse, caret, corrplot, car, relaimpo)

# set working directory containing the data
# you need to change based on your file path accordingly
setwd("D:/NUS ISS MTech EBAC/DSSI/Lecture Material/Day 2/Code Files/R code/R_for_submission")

# read the data file & inpect its structure
data = read.csv("ISPG.csv")

# set initial seed for reproducibility
set.seed(123)

# collect the data indices returned in a list
inds = createDataPartition(data$Bars, p=0.7, list=FALSE, times=1)

train_set = data[inds,]
test_set = data[-inds,]

# initial model with vars such as Price, Promotion...
# train_set
model1 = lm(Bars ~ ., data=train_set)

model2 = stepAIC(model1)

# save your final model
# you need to change your file path accordingly
path = "D:/NUS ISS MTech EBAC/DSSI/Lecture Material/Day 2/Code Files/R code/R_for_submission"

saveRDS(model2, file.path(path, "bar_sales.rds"))
