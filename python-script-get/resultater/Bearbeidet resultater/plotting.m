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
diagonal= [20.11, 13.4, 10.35, 8.6, 7.34, 6.73, 6.17, 5.73, 5.45, 5.18]
endring = [0.348,42.92,55.18,63.22,67.22,69.16,70.85,72.03,72.98,73.88]
diagonal_teoretisk = [20.11, 20.11/2, 20.11/3, 20.11/4, 20.11/5, 20.11/6, 20.11/7, 20.11/8, 20.11/9, 20.11/10 ]

figure;
subplot (311);
  plot(x, trad1, 'bo-');
  ylim([3 22])
  xlim([1 10])
  ylabel('Sekunder')
  grid on;
  text (1.5, 0, "Antall podder");
  xlabel("(a) 1 Tråd")
  
subplot(312);
  plot(x, trad4, 'bo-')
  ylim([3 22])
  xlim([1 10])
  ylabel('Sekunder')
  grid on;
  text (1.5, 0, "Antall podder");
  xlabel("(b) 4 Tråder")
subplot(313);
  plot(x, trad10, 'bo-')
  ylim([3 22])
  grid on;
  xlim([1 10])
  ylabel('Sekunder')
  text (1.5, 0, "Antall podder");
  xlabel("(c) 10 Tråder")

figure
  hold on;
  plot(x, diagonal, 'bo-')
  
  
  plot(x, diagonal_teoretisk, 'ro-')
  for i = 1:1:10;
    diff(i) = diagonal(i)-diagonal_teoretisk(i)
  endfor
  plot(x, diff, 'go-')
  legend("Diagonale verdier fra test", "Teoretiske diagonale verdier", "Testverdier - Teoretiske verdier")
  grid on;
  ylim([0 22])
  xlim([1 10])
  ylabel('Sekunder')
  xlabel("Antall podder og antall tråder")
  