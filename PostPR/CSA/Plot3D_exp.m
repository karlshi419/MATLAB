%plot 3D experiment
%  x=CSA2(:,1);
%  y=CSA2(:,2);
%  z=CSA2(:,3);
%  %[X,Y,Z] = griddata(x,y,z,linspace(620,680)',linspace(0.01,0.08),'v4');
%  [X,Y,Z] = griddata(x,y,z,linspace(1.56,2.26)',linspace(9,34),'v4');
%  surf(X,Y,Z);
%  xlabel('Ts');
%  ylabel('Area');
%  zlabel('Error');


%x=[2500 2300 2100 1900 1700 1500 1300 1100];
%y=[50 100 150 200 250 300 350 400 450];
y=[2.26:-0.02:1.56];    %timing
x=[34 33 32 31 28 27 24 23 18 17 16 15 12 11 9];    %area
[xx,yy]=meshgrid(x,y);

zz=importdata('CSA2_2.mat');

 [xxx,yyy]=meshgrid(9:1:34,1.56:0.01:2.26);
 zzz=interp2(xx,yy,zz,xxx,yyy,'linear');

%surf(xxx,yyy,zzz)

pcolor(xxx,yyy,zzz)
shading interp;
colorbar
xlabel('Area')
ylabel('Ts')