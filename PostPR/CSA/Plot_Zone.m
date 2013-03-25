% present results in different zones
clear;
clc;
RCA_New=importdata('./RCA_New_Area.mat');   %   #1
RCA_Trad=importdata('./RCA_Trad_Area.mat');    %   #2
CSA2=importdata('./CSA2_Area.mat');         %   #3
CSA3=importdata('./CSA3_Area.mat');         %   #4

% scan CSA3, which has the largest width
[len_csa3,wid_csa3]=size(CSA3);
[len_csa2,wid_csa2]=size(CSA2);
[len_rcaN,wid_rcaN]=size(RCA_New);
[len_rcaT,wid_rcaT]=size(RCA_Trad);
len=max([len_csa3,len_csa2,len_rcaN,len_rcaT]);
wid=max([wid_csa3,wid_csa2,wid_rcaN,wid_rcaT]);

TF=33.*ones(len,CSA3(1,1));   %initialize Trade-Off matrix
%TF=zeros(len,CSA3(1,1));   %initialize Trade-Off matrix
for i=1:1:wid_csa3
    %TF(:,CSA3(1,i))=4;
    TF(:,CSA3(1,i))=127;
end

% scan CSA2
for col=1:1:wid_csa2              %scan through column
%for col=1:1:1
    if TF(:,CSA2(1,col))==33%0
        TF(:,CSA2(1,col))=99;%3;
    else                        %already occupied by CSA3
        %area=CSA2(1,i)
        col_csa3=find(CSA3(1,:)==CSA2(1,col)); %certain area number
        for j=1:1:min(len_csa2-1,len_csa3-1)
            if (CSA2(j+1,col)<=CSA3(j+1,col_csa3))
                 TF(j,CSA2(1,col))=99;%3;
            end
        end        
    end
end

%scan RCA_Trad
for col=1:1:wid_rcaT
    if TF(:,RCA_Trad(1,col))==33%0
       TF(:,RCA_Trad(1,col))=2;
    else
        % first compare to CSA3
        col_csa3=find(CSA3(1,:)==RCA_Trad(1,col));
        for j=1:1:min(len_rcaT-1,len_csa3-1)
            if RCA_Trad(j+1,col)<=CSA3(j+1,col_csa3)
                TF(j,RCA_Trad(1,col))=2;
            end
        end
        % then compare to CSA2
        col_csa2=find(CSA2(1,:)==RCA_Trad(1,col));
        for j=1:1:min(len_rcaT-1,len_csa2-1)
            if RCA_Trad(j+1,col)<=CSA2(j+1,col_csa2)
                TF(j,RCA_Trad(1,col))=2;
            end
        end
    end
end
        
%scan RCA_New
for col=1:1:wid_rcaN
    if TF(:,RCA_New(1,col))==33%0
       TF(:,RCA_New(1,col))=69;%1;
    else
        % first compare to CSA3
        col_csa3=find(CSA3(1,:)==RCA_New(1,col));
        for j=1:1:min(len_rcaN-1,len_csa3-1)
            if RCA_New(j+1,col)<=CSA3(j+1,col_csa3)
                TF(j,RCA_New(1,col))=69;%1;
            end
        end
        % then compare to CSA2
        col_csa2=find(CSA2(1,:)==RCA_New(1,col));
        for j=1:1:min(len_rcaN-1,len_csa2-1)
            if RCA_New(j+1,col)<=CSA2(j+1,col_csa2)
                TF(j,RCA_New(1,col))=69;%1;
            end
        end
        % then compare to RCA_Trad
        col_rcaT=find(RCA_Trad(1,:)==RCA_New(1,col));
        for j=1:1:min(len_rcaN-1,len_rcaT-1)
            if RCA_New(j+1,col)<=RCA_Trad(j+1,col_rcaT)
                TF(j,RCA_New(1,col))=69;%1;
            end
        end
        
    end
end

%Plot figure
TFM=TF(1:1:36,:);
[a,b]=find(TFM==2);
TFM(a,b)=69;%1;

Ts=1000./(2.26:-0.02:1.56);
Area=[1:1:44];
[xx,yy]=meshgrid(Area,Ts);
pcolor(xx,yy,TFM);
shading flat%flat/interp/faceted
%contourf(xx,yy,TFM);
xlabel('Area (# of LUTs)');
ylabel('Frequency (MHz)');
colormap gray


    