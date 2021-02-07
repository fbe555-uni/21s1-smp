%This function draw cards - with jokers (LMa version 210819)

games_number=10000 %Number of simulations

%% Question 2

Number_Pikes=0; %Count number of times getting an Pikes in first draw
Number_Clovers=0; %Count number of times getting an Clovers in first draw
Number_Hearts=0; %Count number of times getting an Hearts in first draw
Number_Tiles=0; %Count number of times getting an Tiles in first draw

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    Number_Pikes=Number_Pikes+contains(cards3j(1).name,"Pikes")+contains(cards3j(1).name,"Joker");
    Number_Clovers=Number_Clovers+contains(cards3j(1).name,"Clovers")+contains(cards3j(1).name,"Joker");
    Number_Hearts=Number_Hearts+contains(cards3j(1).name,"Hearts")+contains(cards3j(1).name,"Joker");
    Number_Tiles=Number_Tiles+contains(cards3j(1).name,"Tiles")+contains(cards3j(1).name,"Joker");
end

%% Estimated chance of getting an Pikes, Clovers, Herats and Tiles first
Est_Pikes_first_card=Number_Pikes/games_number
Est_Clovers_first_card=Number_Clovers/games_number
Est_Hearts_first_card=Number_Hearts/games_number
Est_Tiles_first_card=Number_Tiles/games_number


%% Question 3

Number_ace_first=0; %Count number of times getting an ace in first draw

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if cards3j(1).value==1
        Number_ace_first=Number_ace_first+1;
    elseif cards3j(1).value==0
        Number_ace_first=Number_ace_first+1;
    end
end

%% Estimated chance of getting an ace first
Est_Ace_first_card=Number_ace_first/games_number



%% Question 4

Number_ace_of_Hearts_first=0; %Count number of times getting ace of hearts in first draw

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    Number_ace_of_Hearts_first=Number_ace_of_Hearts_first+contains(cards3j(1).name,"Ace of Hearts")+contains(cards3j(1).name,"Joker");
end

%% Estimated chance of getting ace_of_Hearts first
Est_Ace_of_Hearts_first_card=Number_ace_of_Hearts_first/games_number


%% Question 5

Est_Ace_times_Hearts_first_card=Est_Ace_first_card*Est_Hearts_first_card

if Est_Ace_times_Hearts_first_card>=Est_Ace_of_Hearts_first_card-0.002 && Est_Ace_times_Hearts_first_card<=Est_Ace_of_Hearts_first_card+0.002
    string("Ace and Hearts are independent")
else
    string("Ace and Hearts are not independent")
end


%% Question 6

Number_Ace=0; %Count number of times getting an Ace

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if cards3j(1).value==1
        Number_Ace=Number_Ace+1;
    elseif cards3j(1).value==0
        Number_Ace=Number_Ace+1;
    elseif cards3j(2).value==1
        Number_Ace=Number_Ace+1;
    elseif cards3j(2).value==0
        Number_Ace=Number_Ace+1;
    end
end

%% Estimated chance of getting at least one ace in two draws
Est_At_least_one_Ace=Number_Ace/games_number


%% Question 7

Number_Two_Aces=0; %Count number of times getting two Aces

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if cards3j(1).value==1 && cards3j(2).value==1
        Number_Two_Aces=Number_Two_Aces+1;
    elseif cards3j(1).value==0 && cards3j(2).value==1
        Number_Two_Aces=Number_Two_Aces+1;
    elseif cards3j(1).value==1 && cards3j(2).value==0
        Number_Two_Aces=Number_Two_Aces+1;
    elseif cards3j(1).value==0 && cards3j(2).value==0
        Number_Two_Aces=Number_Two_Aces+1;
    end
end

%% Estimated chance of getting at least one ace in two draws
Est_Two_Aces=Number_Two_Aces/games_number


%% Question 8

Number_ace_of_Hearts=0; %Count number of times getting ace of hearts in two draws

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if contains(cards3j(1).name,"Ace of Hearts")
        Number_ace_of_Hearts=Number_ace_of_Hearts+1;
    elseif contains(cards3j(2).name,"Ace of Hearts")
        Number_ace_of_Hearts=Number_ace_of_Hearts+1;
    elseif contains(cards3j(1).name,"Joker")
        Number_ace_of_Hearts=Number_ace_of_Hearts+1;
    elseif contains(cards3j(2).name,"Joker")
        Number_ace_of_Hearts=Number_ace_of_Hearts+1;
    end
end

%% Estimated chance of getting ace_of_Hearts in two draws
Est_Ace_of_Hearts=Number_ace_of_Hearts/games_number


%% Question 9

Number_No_ace_of_Hearts=0; %Count number of times not getting ace of hearts in two draws

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if contains(cards3j(1).name,"Ace of Hearts")+contains(cards3j(2).name,"Ace of Hearts")+contains(cards3j(1).name,"Joker")+contains(cards3j(2).name,"Joker")<1
        Number_No_ace_of_Hearts=Number_No_ace_of_Hearts+1;
    end
end

%% Estimated chance of not getting ace_of_Hearts in two draws
Est_No_Ace_of_Hearts=Number_No_ace_of_Hearts/games_number


%% Question 10

Number_17=0; %Count number of times getting 17 in two draws

for n=1:games_number
    cards3j  = shufflecards3j(); %New shuffling of cards
    if cards3j(1).value+cards3j(2).value==17
        Number_17=Number_17+1;
    elseif cards3j(1).value>=7 && cards3j(2).value==0
        Number_17=Number_17+1;
    elseif cards3j(2).value>=7 && cards3j(1).value==0
        Number_17=Number_17+1;
    end
end

%% Estimated chance of not getting ace_of_Hearts in two draws
Est_17=Number_17/games_number

