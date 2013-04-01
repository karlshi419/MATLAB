% plot results in different zones
% 3nd version
clear;
clc;
RCA_New=importdata('./RCA_New_Area.mat');   %   #1
RCA_Trad=importdata('./RCA_Trad_Area.mat');    %   #2
CSA2=importdata('./CSA2_Area.mat');         %   #3
CSA3=importdata('./CSA3_Area.mat');         %   #4

% scan CSA3, which has the largest width
[len_csa3,wid_csa3]=size(CSA3);

%data processing
delta_csa2=CSA3(1,1)-CSA2(1,1);
temp=repmat(CSA2(:,1),1,delta_csa2);
CSA2=[temp,CSA2];
[len_csa2,wid_csa2]=size(CSA2);
CSA2(1,:)=(CSA3(1,1):-1:CSA2(1,wid_csa2));

delta_rcaT=CSA3(1,1)-RCA_Trad(1,1);
RCA_Trad=[repmat(RCA_Trad(:,1),1,delta_rcaT),RCA_Trad];
[len_rcaT,wid_rcaT]=size(RCA_Trad);
RCA_Trad(1,:)=(CSA3(1,1):-1:RCA_Trad(1,wid_rcaT));

delta_rcaN=CSA3(1,1)-RCA_New(1,1);
RCA_New=[repmat(RCA_New(:,1),1,delta_rcaN),RCA_New];
[len_rcaN,wid_rcaN]=size(RCA_New);
RCA_New(1,:)=(CSA3(1,1):-1:RCA_New(1,wid_rcaN));

[len_csa2,wid_csa2]=size(CSA2);
[len_rcaN,wid_rcaN]=size(RCA_New);
[len_rcaT,wid_rcaT]=size(RCA_Trad);
len=max([len_csa3,len_csa2,len_rcaN,len_rcaT]);
wid=max([wid_csa3,wid_csa2,wid_rcaN,wid_rcaT]);

TF=zeros(len,CSA3(1,1));   %initialize Trade-Off matrix
for i=1:1:wid_csa3
    TF(1:len_csa3,CSA3(1,i))=4;
    %TF(:,CSA3(1,i))=127;
end

for col=1:1:wid_csa2
    if TF(:,CSA2(1,col))==0
       TF(:,CSA2(1,col))=3;
    end    
end

for col=1:1:wid_rcaT
    if TF(:,RCA_Trad(1,col))==0
       TF(:,RCA_Trad(1,col))=2;
    end
end

for col=1:1:wid_rcaN
    if TF(:,RCA_New(1,col))==0
       TF(:,RCA_New(1,col))=1;
    end
end

[len_TF,wid_TF]=size(TF);
for i=wid_TF:-1:4   %area
    col_csa3=find(CSA3(1,:)==i);            %column number of csa2
    col_csa2=find(CSA2(1,:)==i);            %column number of csa2
    col_rcaT=find(RCA_Trad(1,:)==i);        %column number of rcaT
    col_rcaN=find(RCA_New(1,:)==i);         %column number of rcaN
    %for j=1:1:len_TF     %freq
    for j=1:min(length(CSA3),length(CSA2))-1
        csa3_temp=CSA3(j+1,col_csa3);
        csa2_temp=CSA2(j+1,col_csa2);
        rcaT_temp=RCA_Trad(j+1,col_rcaT);
        rcaN_temp=RCA_New(j+1,col_rcaN);
        temp=[rcaN_temp,rcaT_temp,csa2_temp,csa3_temp];
        Ele=find(temp==min(temp));
        %TF(j,i)=min(Ele);
        if find(Ele==1)>0
            if find(Ele==2)>0   % exits RCA_Trad
                TF(j,i)=5;
            else
                TF(j,i)=1;      % exits RCA_New only
            end
        else
            TF(j,i)=min(Ele);
        end                             
    end
end
%  
TFM=TF(1:36,:);
[a,b]=find(TFM==2);
TFM(a,b)=1;
TFM(35:36,4:44)=1;
TFM=[TFM TFM(:,44)];    %add extra column, area=45
%TFM(1:2,4:44)=5;           %set error-free region
%Freq=(2.26:-0.02:1.56);
Freq=1000./(2.26:-0.02:1.56);
Area=(1:45);
[xx,yy]=meshgrid(Area,Freq);
pcolor(xx,yy,TFM);
shading flat;
colormap gray
xlabel('# of LUTs');
ylabel('Frequency (MHz)');






