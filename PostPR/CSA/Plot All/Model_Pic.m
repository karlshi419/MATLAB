% plot figures for CSA & RCA Timing Models
Model=importdata('./Model.mat');
Freq=Model(:,1);                    %frequency values

RCA_Trad=Model(:,2);                %experimental results for RCA
RCA_Model=Model(1:33,3);            %modeled results for RCA

CSA_2stage=Model(:,4);              %experimental results for CSA 2stage
CSA_Model=Model(1:29,5);            %modeled results for CSA

plot(Freq,RCA_Trad,'ko-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
plot(Freq(1:33),RCA_Model,'k^:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
plot(Freq,CSA_2stage,'ks-','linewidth',1.2,'MarkerSize',5);
plot(Freq(1:29),CSA_Model,'kx:','linewidth',1.2,'MarkerSize',8);

hold off;
axis([420,650,1,17]);
legend('RCA','RCA Model','CSA 2stage','CSA Model','Location','SouthWest');
 set(gca,'ygrid','on');
% set(gca,'xgrid','on');
xlabel('Frequency (MHz)');
ylabel('Max. Word-Length');


