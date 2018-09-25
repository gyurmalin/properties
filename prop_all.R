
library(install.load)
install_load("abind", "data.table")

files <- list.files(pattern="20*")
data <- list()

for (i in 1 : length(files)) {
        data [[i]] <- read.csv(files[i], header = TRUE, sep = ";")
}

names(data) <- files

str(data)
head(data[1])

onedata <- abind(data, along=1)

str(onedata)
head(onedata,1)

write.table(onedata, "prop_all_08-17", sep= ";")

#############################

d <- fread("prop_all_08-17.txt", sep= ";")
d <-data.table(d)

q <- d[,.(V1, V2, V3, V4, V5, V6, V7, V8, V10, V11, V12, V14, V15, V16, V17, V18)]

write.table(q, "prop_all_08_17_sel", sep= ";")
