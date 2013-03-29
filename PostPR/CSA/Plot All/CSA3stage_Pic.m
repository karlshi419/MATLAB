%plot fig for CSA 3stage
% 1. Max word-length under given timing
% 2. Area Overhead
Data=importdata('./CSA3stage.mat');
Freq=Data(:,1);
RCA_Trad=Data(:,2);
CSA_2stage=Data(:,3);
CSA_3stage=Data(1:34,4);

Area=importdata('./CSA3Stage_Area.mat');
RCA_Area=Area(:,2);
CSA2_Area=Area(:,3);
CSA3_Area=Area(1:34,4);

figure(1)
plot(Freq,RCA_Trad,'k^:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
plot(Freq,CSA_2stage,'ko-','linewidth',1.2,'MarkerSize',5);
plot(Freq(1:34),CSA_3stage,'ks-','linewidth',1.2,'MarkerSize',5);
hold off;

legend('RCA','CSA 2stage','CSA 3stage','Location','SouthWest');
axis([420,650,1,17]);

xlabel('Frequency (MHz)');
ylabel('Max. Word-Length');

figure(2)
plot(Freq,RCA_Area,'k^-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
plot(Freq,CSA2_Area,'ko-','linewidth',1.2,'MarkerSize',5);
plot(Freq(1:34),CSA3_Area,'ks-','linewidth',1.2,'MarkerSize',5);
hold off;
legend('RCA','CSA 2stage','CSA 3stage','Location','SouthWest');
axis([420,650,0,45]);
xlabel('Frequency (MHz)');
ylabel('# of LUTs');