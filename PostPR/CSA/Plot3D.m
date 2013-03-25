%plot 3d graph
clear;
RCA_Trad=importdata('RCA_Trad.mat');
RCA_New =importdata('RCA_New.mat');
CSA2=importdata('CSA2.mat');

% plot
plot3(RCA_Trad(:,1),RCA_Trad(:,2),log10(RCA_Trad(:,3)),'bd-','linewidth',2,'MarkerSize',5);
hold on;
plot3(RCA_New(:,1),RCA_New(:,2),log10(RCA_New(:,3)),'rs-','linewidth',2,'MarkerSize',5);
plot3(CSA2(:,1),CSA2(:,2),log10(CSA2(:,3)),'gv-','linewidth',2,'MarkerSize',5);
hold off;

%label
xlabel('Ts');
ylabel('Area');
zlabel('Error');
set(gca,'ygrid','on');
set(gca,'xgrid','on');