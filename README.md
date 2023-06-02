# Prak2_Probstat2023_C_5025211057

| Identitas    |                         |
| -------------| ------------------------|                                     
| Nama         | Salsabila Fatma Aripa   |
| NRP          | 5025211057              |
| Kelas        | Probstat (C)            |

### Soal 1
> Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan
aktivitas.
 
| Responden    |  X  |  Y  |                 
| -------------| --- | --- |                                     
| 1            | 78 |  100 |
| 2            | 75 |  95  |
| 3            | 67 |  70  |
| 4            | 77 |  90  |
| 5            | 70 |  90  |
| 6            | 72 |  90  |
| 7            | 78 |  89  |
| 8            | 70 | 100  |
| 9            | 77 | 100  |

> Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

##### 1-A
> Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas

Penyelesaian : membuat 2 vektor x dan y. Lalu menghitung selisih antara elemen-elemen vektor "y" dan vektor "x". Setelah itu menghitung standar deviasinya.
```r
x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# 1a
selisih = y - x 
stdev = sd(selisih)
```
![1a](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/e6b164ed-cd99-483d-b7bd-8d432db17ff7)

Didapatkan :

Selisih -> `22 20  3 13 20 18 11 30 23`

Standar Deviasi -> `7.838651`

##### 1-B
> Carilah nilai t (p-value)

Penyelesaian : 
`mean(selisih)` : menghitung rata-rata dari selisih yang dihitung sebelumnya.
`stdev`         : adalah standar deviasi dari selisih.
`sqrt(9)`       : adalah akar kuadrat dari jumlah elemen dalam vektor "selisih".
`pt`            : adalah fungsi yang menghitung probabilitas distribusi t-student. Dalam kasus ini, parameter pertama yang diberikan adalah (-abs((mean(selisih) - 0) / (stdev / sqrt(9)))), dan parameter kedua adalah df=8 yang menunjukkan derajat kebebasan.

```r
# 1b
t = 2 * pt(-abs(( (mean(selisih) - 0) / (stdev / sqrt(9)))), df=8)
```

![1b](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/a3f3ee34-f514-4265-9bea-7a8055b44a3c)

Didapatkan :

t(p-value) : `0.0001372773`

##### 1-C
> Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam
hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika
diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang
signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴”

Penyelesaian : Dilakukan pengujian hipotesis dengan menggunakan dua metode, yaitu uji varians (variance test) dan uji t (t-test). 
Fungsi `var.test`   : digunakan untuk menguji apakah varians dari dua kelompok data "x" dan "y" memiliki perbedaan yang signifikan. Uji varians ini berguna untuk memeriksa apakah variabilitas data pada kedua kelompok berbeda secara signifikan. Output yang dihasilkan mencakup nilai uji F dan p-value. 
Fungsi `t.test`     : digunakan untuk menguji apakah terdapat perbedaan signifikan antara rata-rata dua kelompok data "x" dan "y".

```r
# 1c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)
```

![1c](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/8d928ba0-ff45-41c8-87ec-395668d3ea3b)

Didapatkan p-value lebih kecil dari significant level (0.05) sehingga hipotesis nol ditolak dan hipotesis alternatif diterima. Hal ini menunjukkan bahwa aktivitas A memberikan pengaruh signifikan dalam kadar saturasi oksigen.

###### Halaman Kerja Soal 1

![halaman kerja 1](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/957dc283-1855-42f3-a6c6-df6eae73fb25)

### Soal 2
> Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer pertahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer (kerjakan menggunakan library seperti referensi pada modul).

Penyelesaian :

Step 1 : Menentukan H0 dan H1

```r
H0: mean <= 25000
H1: mean > 25000
```

Step 2 : Menggunakan Library (BSDA) dan Menentukan variabel

```r
library(BSDA)

mean <- 25000
n <- 100
meanSample <- 23500
sdSample <- 3000
```

Step 3 : Menentukan uji statistik Karena n > 30, maka menggunakan tabel Z.

Step 4 : Menentukan interval confidence dan nilai kritis Dianggap alfa = 0.05 karena tidak disebutkan di soal, maka nilai kritis:

```r
nilaiKritis <- qnorm(p=.05, lower.tail = FALSE)
```

Variabel nilaiKritis digunakan untuk menyimpan nilai kritis dari distribusi normal standar (Z-distribution) dengan probabilitas kumulatif 0.05 pada ekor distribusi yang lebih tinggi.
Fungsi qnorm() digunakan untuk menghitung nilai kritis dari distribusi normal standar. Dalam hal ini, argumen p = 0.05
Didapatkan nilai kritis : 1.64485

Step 5 : Menentukan nilai statistik

```r
z <- (meanSample - mean) / (sdSample / sqrt(n))
```

Variabel z digunakan untuk menghitung nilai statistik z-score. Z-score adalah ukuran sejauh mana suatu nilai tertentu berbeda dari rata-rata populasi dalam satuan deviasi standar.

Didapatkan nilai Z : -5

Step 6 : Menentukan p-value

```r
zsum.test(mean.x=23500, sigma.x = 3000, n.x = 100,  
          alternative = "greater", mu = 25000,
          conf.level = 0.95)
```

Fungsi zsum.test() digunakan untuk melakukan uji z pada perbedaan rata-rata satu sampel terhadap nilai populasi yang ditentukan (mu).

![2](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/361d5aa0-bc5e-40fa-acc8-a22ad8ac30f4)

##### 2-A
> Apakah Anda setuju dengan klaim tersebut? Jelaskan.

Setuju. Didapatkan nilai kritis 1.64485. Maka, jika didapatkan hasil nilai statistik antara -1.64485 dan 1.64485, H0 diterima. Jika diluar jangkauan tersebuat, H0 ditolak. Didapatkan nilai statistik -5. Nilai statistik berada di luar rentang -1.64485 hingga 1.64485, sehingga H0 ditolak.

##### 2-C
> Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

Nilai p-value = 1 atau 100%. Ini menunjukkan bahwa tidak ada bukti yang cukup untuk menolak hipotesis nol. Maka kita tidak memiliki bukti statistik yang mendukung perbedaan yang signifikan antara kelompok data yang sedang diuji.

###### Halaman Kerja Soal 2
![halaman kerja 2](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/0e839c81-5738-44b0-b2c2-8886bff84a1e)

### Soal 3

> Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut      |  Bandung  | Bali |                 
| -----------------------| --------- | ---- |                                     
| Jumlah Saham           | 78        |  100 |
| Sampel Mean            | 75        |  95  |
| Sampel Standar Deviasi | 67        |  70  |

> Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah:

##### 3-A

> H0 dan H1

```r
H0 : meanBandung = meanBali
H1 : meanBandung != meanBali
```

H0 : rata-rata saham bandung sama dengan rata-rata saham Bali H1 : rata-rata saham bandung tidak sama dengan rata-rata saham Bali

##### 3-B

> Hitung sampel statistik

```r
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
```

Fungsi `tsum.test()` digunakan untuk melakukan uji t pada perbedaan rata-rata dua kelompok independen. Output yang dihasilkan oleh `tsum.test()` akan memberikan informasi tentang nilai statistik t, nilai p-value, dan interval kepercayaan jika diberikan.

![3b](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/063b3095-9611-4bc2-acab-dc4101936b6a)

##### 3-C
> Lakukan uji statistik (df =2)

```r
# 3c
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")
```

Fungsi `plotDist()` digunakan untuk menggambar distribusi dari suatu variabel. Dalam contoh ini, argumen dist = 't' digunakan untuk menunjukkan bahwa kita ingin menggambar distribusi t (distribusi t-Student). Argumen df = 2 menentukan derajat kebebasan dari distribusi t (dalam hal ini, df = 2). 

![3c](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/07664ee1-ded7-44e2-9091-c04276923787)

##### 3-D
> Nilai kritikal

```r
# 3d
nilaiKritis2 <- qt(p = alfa, df = 2 , lower.tail = FALSE)
```

Fungsi `qt()` digunakan untuk menghitung nilai kritis (critical value) dari distribusi t-Student. Dalam hal ini, argumen p = alfa digunakan untuk menentukan probabilitas kumulatif (tail probability) yang sesuai dengan tingkat signifikansi (alfa). Argumen df = 2 menunjukkan derajat kebebasan dari distribusi t. Argumen lower.tail = FALSE digunakan untuk menentukan bahwa kita ingin menghitung nilai kritis pada ekor distribusi yang lebih tinggi.

![3d](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/d919dc92-6382-4bb7-a10b-2be272f8e37c)

##### 3-E
> Keputusan

H0 ditolak karena p-value < 0.05

##### 3-F
> Kesimpulan

Tidak ada bukti yang cukup bahwa rata-rata saham bandung sama dengan rata-rata saham Bali

###### Halaman Kerja Soal 3
![halaman kerja 3](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/623ec3fc-5ade-449e-a30b-246ae2f8fbb1)

### Soal 4

> Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut:
https://drive.google.com/file/d/1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4/view.
Dengan data tersebut:

![4awal](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/251df45b-0cfb-40a0-998d-40df867ee2a5)

##### 4-A
> Buatlah plot sederhana untuk visualisasi data.

Penyelesaian

```r
# 4a - Create a scatter plot
ggplot(data = GLASSTEMPLIGHT, aes(x = Temp, y = Light)) +
  geom_point() +
  facet_grid(.~Glass, labeller = label_both)
```

Library ggplot2 digunakan untuk memvisualisasi data. Dari fungsi tersebut, didapatkan grafik sebagai berikut.

![4a](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/223c5775-afe4-4fb3-89c4-ce26fda175dd)

##### 4-B
> Lakukan uji ANOVA dua arah.

Penyelesaian

```r
# 4b - Convert variables to factors
GLASSTEMPLIGHT$Glass <- as.factor(GLASSTEMPLIGHT$Glass)
GLASSTEMPLIGHT$Temp_Factor <- as.factor(GLASSTEMPLIGHT$Temp)

# Print the updated structure of the dataset
str(GLASSTEMPLIGHT)

# Perform ANOVA
anova <- aov(Light ~ Glass * Temp_Factor, data = GLASSTEMPLIGHT)
summary(anova)
```

Dibuat variabel independen, yaitu factor. Kemudian, anova dilakukan menggunakan fungsi `aov()`. Didapatkan hasil sebagai berikut
![4b](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/90c53a0e-c858-4972-bcd7-4dde38b56a52)

##### 4-C
> Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap  perlakuan (kombinasi kaca pelat muka dan suhu operasi).

```r
# 4c - Calculate summary statistics
data_summary <- GLASSTEMPLIGHT %>%
  group_by(Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
```
Cara diatur dalam urutan menurun untuk menambahkan huruf superskrip dari tes Tukey. Didapatkan hasil sebagai berikut.
![4c](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/7da56a77-5b73-4a8a-877e-cfad5f980db4)

###### Halaman Kerja Soal 4
![halaman kerja 4](https://github.com/bilaaripa/Prak2_Probstat2023_C_5025211057/assets/114417418/c323d931-2f84-4319-8726-535d535b82e8)
