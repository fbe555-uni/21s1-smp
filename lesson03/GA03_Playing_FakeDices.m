function Playing_FakeDices
%%Group Assignment 03: Playing fake dices

%Q1: Number of possible outcomes to get X as sum of tree dice-rolls
Sum=zeros(1,20); %Counters of possible outcomes with sum X
for x1=1:6
    for x2=1:6
        for x3=1:6
           Sum(x1+x2+x3)=Sum(x1+x2+x3)+1;
        end
    end
end
Outcomes=Sum

N=100000; %Number of plays (simulations)
n=zeros(1,20); %Counters
n1_6=0;
n23_6=0;

%Roll dices 
for i=1:N
    X1=randi(7); %Dice 1
    if X1>=6
        X1=6;
    end
    X2=randi(7); %Dice 2
    if X2>=6
        X2=6;
    end
    X3=randi(7); %Dice 3
    if X3>=6
        X3=6;
    end
    X=X1+X2+X3; %Sum of dices
    n(X)=n(X)+1; %Count number of plays with sum=X
    if X1==6
        n1_6=n1_6+1; %Count number of plays with first roll=6
        if X2+X3>=6
            n23_6=n23_6+1; %Count number of plays with 1st roll=6 and sum>=12
        end
    end 
end

%Q2: pmf
for X=1:20
    pmf(X)=n(X)/N; %pmf(X)
end
stem(pmf,'kx') %Stem plot
title('Probability Mass Function')
xlabel('x')
ylabel('pmfX')

%Q3: cdf
for x=1:200
    FX(x)=cdfX(x/10,pmf,1,20);
end
figure(2)
plot(FX) %Stem plot
title('Cumulative Distribution Function')
xlabel('x')
ylabel('cdfX')

%Q4: Pr(X=8)
Pr_8=n(8)/N %Relative frewuency probability
pmf_8=pmf(8) %pmf probability

%Q5: Pr(X>=12)
Pr_min12=(n(12)+n(13)+n(14)+n(15)+n(16)+n(17)+n(18))/N

%Q6: Pr(9<=X<=16)
Pr_min9_max15=(n(9)+n(10)+n(11)+n(12)+n(13)+n(14)+n(15))/N

%Q7: Pr(X<4 or X>16)
Pr_max3_min16=(n(3)+n(17)+n(18))/N

%Q8+9: Mean, variance and standard deviation
EX=0;
EX2=0;
for X=3:18
    EX=EX+X*n(X)/N;
    EX2=EX2+X^2*n(X)/N;
end
EX %Mean
VarX=EX2-EX^2 %Variance
SDX=sqrt(VarX) % Standard deviation

%Q10: Pr(|X-EX|<=(1,2,3)*SDX)
nSD=zeros(1,3); %Counters
for X=3:18
    if abs(X-EX)<=SDX
        nSD(1)=nSD(1)+n(X); %Number of rolls within 1SD
    end
    if abs(X-EX)<=2*SDX
        nSD(2)=nSD(2)+n(X); %Number of rolls within 2SD
    end
    if abs(X-EX)<=3*SDX
        nSD(3)=nSD(3)+n(X); %Number of rolls within 3SD
    end
end
Pr_1SD=nSD(1)/N %Probability of sum within 1SD
Pr_2SD=nSD(2)/N %Probability of sum within 2SD
Pr_3SD=nSD(3)/N %Probability of sum within 3SD

%Q11: Pr(X>=12 given X1=6)
Pr_6_12=n23_6/n1_6 %1st roll=6 and sum>=12

