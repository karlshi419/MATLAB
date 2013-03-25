% Plot 3D plane graph
% using correct data!!!!!!!!!!
RCA_Trad=importdata('RCA_Trad_2.mat');
CSA2=importdata('CSA2_2.mat');
RCA_New=importdata('RCA_New_2.mat');
CSA_3stage=importdata('CSA_3.mat');

%plot RCA_Trad
Area1=[18:-1:4];    %area
Ts1=[2.26:-0.02:1.56];    %timing (ns)
[xx1,yy1]=meshgrid(Area1,Ts1);

[xxx1,yyy1]=meshgrid(4:1:18,1.56:0.01:2.26);
pic_RCA_Trad=interp2(xx1,yy1,RCA_Trad,xxx1,yyy1,'linear');

surf(xxx1,yyy1,pic_RCA_Trad);
hold on;
%plot CSA 2stage
Area2=[34 33 32 31 28 27 24 23 18 17 16 15 12 11 9];    %area
Ts2=[2.26:-0.02:1.56];    %timing (ns)
[xx2,yy2]=meshgrid(Area2,Ts2);

[xxx2,yyy2]=meshgrid(9:1:34,1.56:0.01:2.26);
pic_CSA_2=interp2(xx2,yy2,CSA2,xxx2,yyy2,'linear');

surf(xxx2,yyy2,pic_CSA_2);

%plot RCA New

pic_RCA_New=interp2(xx1,yy1,RCA_New,xxx1,yyy1,'linear');

surf(xxx1,yyy1,pic_RCA_New);

%plot CSA 3stage
Area4=[44 41 38 35 30 29 28 27 25 23 20 18 16];    %area
Ts4=[2.26:-0.02:1.6];
[xx4,yy4]=meshgrid(Area4,Ts4);

[xxx4,yyy4]=meshgrid(16:1:44,1.6:0.01:2.26);
pic_CSA_3stage=interp2(xx4,yy4,CSA_3stage,xxx4,yyy4,'linear');

surf(xxx4,yyy4,pic_CSA_3stage);

hold off;


xlabel('Area');
ylabel('Ts');



