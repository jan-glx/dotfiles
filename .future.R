#library(future.batchtools)
future::plan(future.batchtools::batchtools_lsf, resources = list(walltime = 3600*4, memory = "8G", queue="long"), earlySignal = TRUE, split = TRUE, workers=10)

