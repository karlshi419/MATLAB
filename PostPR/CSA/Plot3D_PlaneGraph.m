% Plot 3D plane graph
%
RCA_Trad=importdata('RCA_Trad.mat');
RCA_New=importdata('RCA_New.mat');
CSA2=importdata('CSA2.mat');

%plot CSA
x1=CSA2(:,1);
y1=CSA2(:,2);
z1=CSA2(:,3);
 %[X,Y,Z] = griddata(x,y,z,linspace(620,680)',linspace(0.01,0.08),'v4');
[X1,Y1,Z1] = griddata(x1,y1,z1,linspace(1.56,2.26)',linspace(9,34),'v4');
surf(X1,Y1,Z1);
hold on;
%plot rca trad
x2=RCA_Trad(:,1);
y2=RCA_Trad(:,2);
z2=RCA_Trad(:,3);

[X2,Y2,Z2] = griddata(x2,y2,z2,linspace(1.56,2.26)',linspace(4,18),'v4');
surf(X2,Y2,Z2);

%plot RCA New
x3=RCA_New(:,1);
y3=RCA_New(:,2);
z3=RCA_New(:,3);

[X3,Y3,Z3] = griddata(x3,y3,z3,linspace(1.56,2.26)',linspace(15,18),'linear');
surf(X3,Y3,Z3);
hold off;




xlabel('Ts');
ylabel('Area');
zlabel('Error');
