library(plumber)
library(jsonlite)

pr = plumb("deploy_noYAML.R")
#to process a plumber API
pr$run(port = 8000)