clc;
clear;
BTC = xlsread('BTC-USD.xlsx',1,'E2:E2946');    %Closing Price (chart) of the asset
%Data= xlsread('BTC-USD.xlsx',1,'B2:E2946');   %(Open,High,Low,Close)
Sn=[21 50 100 200 500];                            %Desired SMAs (User input)
sum=0;                                         %Variable


%%**********************************SMAs**********************************%%
SMA(length(BTC),length(Sn))=zeros;             %Matrix for the SMAs
for n=1:1:length(Sn)                           %Loop for every SMA
    if length(BTC)>=Sn(n)
      for j=Sn(n):1:length(BTC)                %Loop for every time slot
        sum=0;
        for i=(j-Sn(n)+1):1:j                  %Loop for summation
            sum=sum+BTC(i);
        end
        sum=sum/Sn(n);                         %Find the Average for the specific time period and SMA
        SMA(j,n)=sum;                          %Pass it on the results matrix  
      end
    end
end

%Plot
figure (1);
hold on;
plot(BTC,'DisplayName','Price','LineWidth',1.1);
title('Simple Moving Averages');
xlabel('Time');
ylabel('Price');
for n=1:1:length(Sn)
plot(SMA(:,n),'DisplayName',[num2str(Sn(n)) ' SMA'],'LineWidth',1.1);
end
legend('Location','northwest');
hold off;

%figure (2);
%candle(Data,'r');
%candlesticks(Data(:,1),Data(:,2),Data(:,3),Data(:,4));



