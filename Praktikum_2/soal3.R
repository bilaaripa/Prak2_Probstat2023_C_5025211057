# ------------ NO 3 ---------------

# 3a
#H0 : meanBandung = meanBali
#H1 : meanBandung != meanBali

# 3b
alfa <- 0.05
confLevel <- 0.95

nBandung = 20
meanBandung = 3.64
sigmaBandung = 1.67

nBali = 27
meanBali = 2.79
sigmaBali = 1.5

tsum.test(mean.x = meanBandung, s.x = sigmaBandung, n.x =  nBandung,
          mean.y = meanBali, s.y = sigmaBali, n.y = nBali, 
          alternative = "greater", mu = 0, var.equal = TRUE,
          conf.level = confLevel)

# 3c
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")


# 3d
nilaiKritis2 <- qt(p = alfa, df = 2 , lower.tail = FALSE)
nilaiKritis2

# 3e keputusan
# H0 ditolak karena p-value < 0.05

# 3f kesimpulan
# Tidak ada bukti yang cukup bahwa rata-rata saham bandung
# sama dengan rata-rata saham Bali


