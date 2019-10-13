install.packages("future.callr")
install.packages("here")
install.packages("doFuture")
library("future.callr")
library("here")
library("doFuture")
registerDoFuture()

plan(callr, workers = 4)

files = list.files(here("tests/tests-seq"), full.names = TRUE)
files = files[-16]

foreach (i = files) %dopar% {
  source(i)
}
