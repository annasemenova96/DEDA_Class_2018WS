# clear all variables
rm(list = ls(all = TRUE))
graphics.off()
# set the working directory setwd('C:/...')

# read the market caplitalization of 100 firms
mc = as.vector(read.csv("100 companylist 2012 classified by industry.csv")[, 4])

# read the total connecteness matrix aggregated over windows
tot.ct = as.matrix(read.csv("tot_c_overtime.csv"))

# there are 266 windows
windows = 266

# ranks the risk receivers
sif_in = rep(0, 100)
for (i in 1:100) {
  in_firms  = tot.ct[i, ]
  sif_in[i] = mc[i] * (sum((in_firms/windows) * mc))
}
names(sif_in) = colnames(tot.ct)
print(sort(sif_in, decreasing = TRUE))

# ranks the risk emitters
sif_out = rep(0, 100)
for (i in 1:100) {
  out_firms  = tot.ct[, i]
  sif_out[i] = mc[i] * (sum((out_firms/windows) * mc))
}
names(sif_out) = colnames(tot.ct)
print(sort(sif_out, decreasing = TRUE))
