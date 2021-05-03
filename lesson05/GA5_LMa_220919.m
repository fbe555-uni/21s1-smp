%% GA5 - Transformations and Multivariate Random Variables

%% Flight_Simulator - Rayleigh-data
clear all

%Creation of Rayleigh-distributed data-points
N=10000;  %Number of datapoints
y = rand(N,1);  %Random numbers between 0 and 1
sigma = 7;  %Rayleigh-function parameter (mean=sigma*sqrt(pi/2))
x = sqrt(-2.*sigma^2.*log(1-y));  %Invers cdf of Rayleigh-distribution

%Scatter-plot of the random Rayleigh-distributed data-points
figure(1)
scatter(1:N,x,'.')

%Histogram of the data-points -> Rayleigh-density function
figure(2)
hist(x,100);

%For comparason a plot of the matemathical Rayleigh-function
for i=1:100
    xx(i)=N*max(x)/100*i./sigma^2.*exp(-i^2./(2*sigma^2.));  %Rayleigh-function renormeret
end
figure(3)
plot(1:35,xx(1:35))



%% Exponential_data
clear all

%Creation of exponential-distributed data-points
N=10000;  %Number of datapoints
y = rand(N,1);  %Random numbers between 0 and 1
lambda = 1/8;  %Exonential-function parameter
x = -1/lambda.*log(1-y);  %Invers cdf of exponential-distribution

%Scatter-plot of the random exponential-distributed data-points
figure(4)
scatter(1:N,x,'.')

%Histogram of the data-points -> ExponentialRayleigh-density function
figure(5)
hist(x,100);

%For comparason a plot of the matemathical Exponential-function
for i=1:80
    xx(i)=N*max(x)/100*lambda.*exp(-i*max(x)/80.*lambda);  %Exponential-function renormeret
end
figure(6)
plot(1:80,xx(1:80))



%Linear transformation of uniform distribution
clear all;

X=3*rand(1,20)-1;  %20 random numbers between -1 and 2
Y=-3*X+4;  %Linear transformation of X

%Scatter-plot of X
figure(1)
scatter(1:20,X,'x')
title('X=U(-1,2)')
xlabel('Sample n')
ylabel('X')

%Scatter-plot of Y
figure(2)
scatter(1:20,Y,'x')
title('Y=U(-2,7)')
xlabel('Sample n')
ylabel('Y')

%Scatter-plot of Y aganist X
figure(3)
scatter(X,Y,'x')
title('Y=-3X+4')
xlabel('X')
ylabel('Y')



%Resistors in series
clear all;

N=100000; %Number of simulations
R1=240*rand(1,N)+2280;
R2=10*rand(1,N)+95;
R=R1+R2;
figure(10)
hist(R,250)
title('pdf of R=2.4k+0.1k Ohm')
xlabel('R=R1+R2')
ylabel('Number')
Mean_R12=mean(R)
SD_R12=sqrt(var(R))

R0=250*rand(1,N)+2375;
figure(11)
hist(R0,250)
title('pdf of R=2.5k Ohm')
xlabel('R=R0')
ylabel('Number')
Mean_R0=mean(R0)
SD_R0=sqrt(var(R0))

R3=125*rand(1,N)+62.5;
R4=125*rand(1,N)+62.5;
R34=R3+R4;
figure(12)
hist(R34,250)
title('pdf of R=.25k+1.25k Ohm')
xlabel('R=R3+R4')
ylabel('Number')
Mean_R34=mean(R34)
SD_R34=sqrt(var(R34))



%% Central limit theorem
clear all

for sumNumber=1:9
     number =sumNumber;
[x1,y1,x2,y2] = GiveMeX(sumNumber); %Average of sumNumber Rayleigh/Uniform stochastic variables 
figure(13)
plotMitsubplot(x1,y1,number,sumNumber) %Plot of the 9 Rayleight stochastic variables
figure(14)
plotMitsubplot(x2,y2,number,sumNumber) %Plot of the 9 Uniform stochastic variables
end

function [x1,y1,x2,y2] = GiveMeX(number) 
for n=1:100000
  x1(n) = sum(Rayleigh_rand(number))/number; %The average stochastic variable of number Rayleigh stochastic variables 
  x2(n) = sum(Uniform_rand(number))/number; %The average stochastic variable of number Uniform stochastic variables 
end

[y1 x1] = hist(x1,101);
y1 =101.*y1./(sum(y1)*round(max(x1))); %Normalized histogram -> cdf

[y2 x2] = hist(x2,101);
y2 =101.*y2./(sum(y2)*round(max(x2))); %Normalized histogram -> cdf
end

function plotMitsubplot(x,y,number,sumNumber) %Plot of the 9 average stochastic variables
subplot(3,3,number)
plot(x,y,'b','linewidth',2)
grid
hold on
axis([min(x) max(x) 0 max(y) ])
title(['Terms:', num2str(sumNumber)])
end

function x = Rayleigh_rand(N) %Generation of N Rayleigh distributed random numbers
xx = rand(N,1);
sigma = 1;
x = sqrt(-2.*sigma^2.*log(1-xx));
end

function x = Uniform_rand(N) %Generation of N uniform distributed random numbers
x = rand(N,1);
end

