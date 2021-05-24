%%Hubble
clear
close all
%Data fra lektionen (Hubbles law):
Distance =[0.032 0.034 0.214 0.263 0.275 0.275 ...
           0.450 0.500 0.500 0.630 0.800 0.900 ...
           0.900 0.900 0.900 1.000 1.100 1.100 ...
           1.400 1.700 2.000 2.000 2.000 2.00];

Speed = [170 290 -130 -70 -185 -220 200 290 ...
         270 200 300 -30 650 150 500 920 ...
         450 500 500 960 500 850 800 1090];
     
X=Distance;
Y=Speed;

%Matlab check (ikke nok til eksamen!!)
coefficients = polyfit(X, Y, 1)
fittedY = polyval(coefficients, X);

%Beregn koefficienter:
meanX = sum(X)/length(X);
meanY = sum(Y)/length(Y);
sXX=sum((X-meanX).^2);
sYY=sum((Y-meanY).^2);
sXY = 0;
for n=1:length(X)
   sXY = sXY +(X(n)-meanX)*(Y(n)-meanY);
end

%For den lineære linie: y = betahat*x + alphahat;
betahat= sXY/sXX
alphahat = meanY -betahat.*meanX

figure(1)
%Data:
plot(X, Y, 'bo', 'LineWidth', 3, 'MarkerSize', 2);
grid on;
fontSize = 20;
title('Hubbles Law', 'FontSize', fontSize);
xlabel('X = Distance', 'FontSize', fontSize);
ylabel('Y = Speed', 'FontSize', fontSize);
hold on;
%Regressionslinje:
plot(X, fittedY, 'rs-','LineWidth', 2);
legend('Y', 'Fitted Y');

%Empirisk varians, skal bruges til statistisk tests.
sr2=(1)/(length(X)-2)*sum((Y-(alphahat+betahat*X)).^2);

%Test for hældning/beta:
%H0 hypotesen er at beta er 0
beta0=0;
t_beta= (betahat-beta0)/(sqrt(sr2/sXX))

%p value
pval_beta = 2.*(1-tcdf(abs(t_beta),length(X)-2))

%95% confidens for beta
t0= tinv(1-0.05/2,length(X)-2);
beta_minus=betahat-t0*sqrt(sr2/sXX)
beta_plus=betahat+t0*sqrt(sr2/sXX)

%Test for skæring med y-akse/alpha
%H0 hypotesen er at alpha er 0
alpha0=0;  
t_alpha= (alphahat -alpha0)/(sqrt(sr2*(1/length(X)+meanX^2/sXX)))

%p value
pval_alpha= 2*(1-tcdf(abs(t_alpha),length(X)-2))

%95% konfidens for alpha
alpha_minus = alphahat -t0*sqrt(sr2*(1/length(X)+meanX^2/sXX))
alpha_minus = alphahat +t0*sqrt(sr2*(1/length(X)+meanX^2/sXX))

%Coefficient of Determination (r^2)
r2=sXY^2/(sXX*sYY)

%Test for normalitet
%Residualer
res=Y-alphahat-betahat*X;

%Q-Q plot
figure(2)
qqplot(res)

%Residual plot
figure(3)
plot(X,res,'+',[0 2.1],[0,0],'LineWidth', 1)
title('Residual plot')
axis([0 2.1 -400 600])
xlabel('X')
ylabel('Residualer')