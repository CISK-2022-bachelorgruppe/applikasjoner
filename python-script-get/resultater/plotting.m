clear;
close all;
x = 1:1:10
trad1 = [20.11, 19.93,19.95,19.98,19.96,20.01,20,20.01,20.04,20.04]
trad2 = [19.71,13.4,12.6,11.99,11.77,11.51,11.32,11.23,11.24,11.25]
trad3 = [19.83,12.23,10.35,9.62,9.3,8.97,8.84,8.71,8.6,8.49]
trad4 = [19.96,12.07,9.72,8.6,8.11,7.88,7.53,7.5,7.38,7.34]
trad5 = [19.95,11.8,9.23,8.13,7.34,7.19,6.95,6.75,6.67,6.54]
trad6 = [19.72,11.26,8.76,7.7,7.17,6.73,6.53,6.36,6.13,6.08]
trad7 = [19.73,11.38,8.74,7.42,6.89,6.42,6.17,6.05,5.9,5.75]
trad8 = [19.81,11.03,8.63,7.3,6.8,6.34,5.99,5.73,5.7,5.54]
trad9 = [19.84,11.23,8.29,7.3,6.67,6.28,5.88,5.67,5.45,5.36]
trad10 = [19.83,11.17,8.49,7.24,6.52,6.12,5.74,5.57,5.46,5.18]

endring = [0.348,42.92,55.18,63.22,67.22,69.16,70.85,72.03,72.98,73.88]


figure;
subplot (321);
  plot(x, trad1);
  ylim([3 22])
  title ("1 Tråd")

subplot (322);
  plot(x, trad2)
  ylim([3 22])
  title("2 Tråder")

subplot(323);
  plot(x, trad3)
  ylim([3 22])
  title("3 Tråder")
  xlabel("Antall Podder")
  
subplot(324);
  plot(x, trad4)
  ylim([3 22])
  title("4 Tråder")
subplot(325);
  plot(x, trad5)
  ylim([3 22])
  title("5 Tråder")
subplot(326);
  plot(x, trad6)
  ylim([3 22])
  title("6 Tråder")

figure;
subplot(221);
  plot(x, trad7)
  ylim([3 22])
  title("7 Tråder")
subplot(222);
  plot(x, trad8)
  ylim([3 22])
  title("8 Tråder")
subplot(223);
  plot(x, trad9)
  ylim([3 22])
  title("9 Tråder")
subplot(224);
  plot(x, trad10)
  ylim([3 22])
  title("10 Tråder")
  
figure;
plot(x, endring)
title("Prosent reduksjon fra 1 til 10 tråder")
xlabel("Podder")
ylabel("Reduksjon fra 1 til 10 tråder i %")