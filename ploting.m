clear
clc
s10=textread('solution10.txt');
s30=textread('solution30.txt');
s50=textread('solution50.txt');
s80=textread('solution80.txt');
s100=textread('solution100.txt');
s120=textread('solution120.txt');
s150=textread('solution150.txt');
s200=textread('solution200.txt');
temp=[s10(:,7:8),s30(:,7:8),s50(:,7:8),s80(:,7:8),s100(:,7:8),s120(:,7:8),s150(:,7:8),s200(:,7:8)];
figure(1);
plot(s10(:,7),s10(:,8),'*',s30(:,7),s30(:,8),'o',s50(:,7),s50(:,8),'x',s80(:,7),s80(:,8),'^',s100(:,7),s100(:,8),'+',s120(:,7),s120(:,8),'d',s150(:,7),s150(:,8),'d',s200(:,7),s200(:,8),'d');
legend('10generations','30generations','50generations','80generations','100generations','120generations','150generations','200generations');
hold on
final=s500(:,1:8);
torque=impellerfit([final(:,1:6),30000*ones(length(final(:,1)),1)]);
finalall=[final,torque(:,3)];
HImax=1.543/130;
HImin=1.543/140;
Pmax=-60;
Pmin=-70;
hh=fill([Pmin,Pmin,Pmax,Pmax],[HImin,HImax,HImax,HImin],[0.9805 0.7031 0.6797]);
set(hh,'edgealpha',0,'facealpha',0.3);
U=find(finalall(:,7)<=-60&finalall(:,7)>=-70);
figure(2);
plot(finalall(U,9),'o');
for ii=1:length(U)
    select(ii,:)=finalall(U(ii),1:6);
end
curve1=zeros(length(U),4);
curve2=zeros(length(U),4);
curve1all=zeros(100,1);

curve1(:,4)=-select(:,4:6)*[1.5^3;1.5^2;1.5];
curve1all=-finalall(:,4:6)*[1.5^3;1.5^2;1.5];
P=find(curve1all>=8.7);
ttt=finalall(P,7);
qqq=finalall(P,8);
curve1(:,1:3)=select(:,4:6);
curve2(:,1:3)=select(:,1:3);
curve2(:,4)=6*ones(length(U),1);
x0=0:0.01:1.5;
figure(3);
for jj=1:length(U)
    y0=curve1(jj,:)*[x0.^3;x0.^2;x0.^1;x0.^0];
    plot(x0,y0);
    hold on
end
x1=0:0.01:3*140/180*3.14159265358979;
figure(4);
for jj=1:length(U)
    y1=curve2(jj,:)*[x1.^3;x1.^2;x1.^1;x1.^0];
    plot(x1,y1);
    hold on
end
figure(5);
plot(ttt,qqq,'o');

