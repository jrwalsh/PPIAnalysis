testCoexp_TP <- read.delim("~/Desktop/testCoexp_TP.out", header=FALSE) #HC set

testCoexp <- read.delim("~/Desktop/testCoexp.out", header=FALSE) #Predicted set
coexp_TP <- testCoexp$V2[testCoexp$V3 == 'TP'] #Only TP from predicted
coexp_FP <- testCoexp$V2[testCoexp$V3 == 'FP'] #Only FP from predicted



plot(density(coexp_FP), col="red", main = 'All PCC values for FP, TP, and HC sets', xlab = 'PCC Value', ylab = 'Density', ylim = c(0,10))
lines(density(testCoexp_TP$V2), col="green")
lines(density(coexp_TP), col="blue")
legend("topright", c('FP', 'HC', 'TP'), fill = c("red", "green", "blue"))


plot(density(coexp_FP[coexp_FP < 0]), col="red", main = 'Negative PCC values for FP, TP, and HC sets', xlab = 'PCC Value', ylab = 'Density', ylim = c(0,10))
lines(density(testCoexp_TP$V2[testCoexp_TP$V2 < 0]), col="green")
lines(density(coexp_TP[coexp_TP < 0]), col="blue")
legend("topleft", c('FP', 'HC', 'TP'), fill = c("red", "green", "blue"))


plot(density(coexp_FP[coexp_FP > 0]), col="red", main = 'Positive PCC values for FP, TP, and HC sets', xlab = 'PCC Value', ylab = 'Density', ylim = c(0,10))
lines(density(testCoexp_TP$V2[testCoexp_TP$V2 > 0]), col="green")
lines(density(coexp_TP[coexp_TP > 0]), col="blue")
legend("topright", c('FP', 'HC', 'TP'), fill = c("red", "green", "blue"))



t.test(coexp_FP, coexp_TP)
t.test(coexp_FP[coexp_FP < 0], coexp_TP[coexp_TP < 0])
t.test(coexp_FP[coexp_FP > 0], coexp_TP[coexp_TP > 0])
t.test(coexp_FP[coexp_FP > 0], testCoexp_TP$V2[testCoexp_TP$V2 > 0])
t.test(coexp_TP[coexp_TP > 0], testCoexp_TP$V2[testCoexp_TP$V2 > 0])