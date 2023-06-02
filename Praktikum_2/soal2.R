# ------------ NO 2 ---------------
library(BSDA)

mean <- 25000
n <- 100
meanSample <- 23500
sdSample <- 3000
nilaiKritis <- qnorm(p=0.05, lower.tail = FALSE)
z <- (meanSample - mean) / (sdSample / sqrt(n))


zsum.test(mean.x=23500, sigma.x = 3000, n.x = 100,  
          alternative = "greater", mu = 25000,
          conf.level = 0.95)

# 2a
# Setuju
# Didapatkan nilai kritis 1.64485. Maka, jika didapatkan hasil 
# nilai statistik antara -1.64485 dan 1.64485, H0 diterima. 
# Jika diluar jangkauan tersebuat, H0 ditolak.
# Didapatkan nilai statistik -5. Nilai statistik berada 
# di luar rentang -1.64485 hingga 1.64485, sehingga H0 ditolak.

# 2c
#Nilai p-value = 1 atau 100%. Ini menunjukkan bahwa tidak ada 
#bukti yang cukup untuk menolak hipotesis nol. Maka kita tidak 
#memiliki bukti statistik yang mendukung perbedaan yang signifikan 
#antara kelompok data yang sedang diuji.
