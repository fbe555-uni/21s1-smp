%function ResistorProduction()
clear all

%% Question 1: How many percent of the produced resistors are in each package
% We have the standard deviation sigma=2
mu=100;
sigma=5;

% 5% below 100 Ohm is 95 Ohm
P_CDF95 = normcdf(95,mu,sigma);    %Probability for x<95

% 10% below 100 Ohm is 90 Ohm
P_CDF90 = normcdf(90,mu,sigma);    %Probability for x<90

%Probability of getting a value above 95 and below 105, since Gaussian
%function is symetric, we find the percentage
Prob_5pct=(1-2*P_CDF95)*100    %Probability for 95<x<105

%Probability of getting a value between 90 and 95 or between 105 and 110, since Gaussian
%function is symetric, we find the percentage
Prob_10pct=2*(P_CDF95-P_CDF90)*100

%Probability of getting a value below 90 and above 110, since Gaussian
%function is symetric, we find the percentage
Prob_discared=2*P_CDF90*100



%% Question 2: Simulation of question 1
nResistor=1000;
DiscardedRes=0;
Res10pct=0;
Res5pct=0;
Res=sigma*randn(1,nResistor)+mu;

for n=1:nResistor
   if  Res(n)>110 || Res(n)<90
      DiscardedRes= DiscardedRes+1;
      
   else if Res(n)>105 || Res(n)<95
       Res10pct=Res10pct+1;
       else 
    Res5pct=Res5pct+1;       
       end
       
   end
end

%Percentage of 5% resistor:
Sim_5pct=100*Res5pct/nResistor

%Percentage of 10% resistor:
Sim_10pct=100*Res10pct/nResistor

%Percentage of resistor discarded:
Sim_discarded= 100*DiscardedRes/nResistor


%% Question 3: SD so 5% package contains half of the produced resistors
Sigma_ny=sigma;
for n=1:10000
    if 95<norminv(0.25,mu,Sigma_ny)   %Since Gaussian function is symmetric, 
                                      %the probability of getting a value
                                      %below 95 should be 0,25
        Sigma_ny=Sigma_ny+0.001;
    end
end
Sigma_ny


%% Question 4: Plot the pdf and cdf
nResistors=1000;
Res_ny=Sigma_ny*randn(1,nResistors)+mu;    %Random sample of normal distributed resistors
nintervals=40; %Number of intervals in pdf- and cdf-plots

%pdf of the resistor values
figure(1)
histogram(Res_ny,nintervals,'Normalization','pdf') %Bar-plot of the pdf of the resistor values
title('pdf')

%cdf of the resistor values
figure(2)
histogram(Res_ny,nintervals,'Normalization','cdf') %Bar-plot of the cdf of the resistor values
title('cdf')


%% Question 5: Mean and SD of new production
Mean_Res_ny=mean(Res_ny)

%Standard deviation
SD_Res_ny=sqrt(var(Res_ny))



%% Question 6: Why are the found mean and SD not exact?
"The sample size is not large enough"