% plot fig for error-area-freqency tradeoffs
% original data: ~/Log/OverclockingPostP&RSimulation/CSA3D/3D.xlsx
Error_LUT45=importdata('./Error_LUT45.mat');
Freq=Error_LUT45(:,1);
RCA_New_45      =Error_LUT45(:,2);
RCA_Trad_45     =Error_LUT45(:,3);
CSA_2stage_45   =Error_LUT45(:,4);
CSA_3stage_45   =Error_LUT45(1:34,5);


Error_LUT35=importdata('./Error_LUT35.mat');
RCA_New_35      =Error_LUT35(:,2);
RCA_Trad_35     =Error_LUT35(:,3);
CSA_2stage_35   =Error_LUT35(:,4);
CSA_3stage_35   =Error_LUT35(1:34,5);

Error_LUT25=importdata('./Error_LUT25.mat');
RCA_New_25      =Error_LUT25(:,2);
RCA_Trad_25     =Error_LUT25(:,3);
CSA_2stage_25   =Error_LUT25(:,4);
CSA_3stage_25   =Error_LUT25(1:34,5);

Error_LUT15=importdata('./Error_LUT15.mat');
RCA_New_15      =Error_LUT15(:,2);
RCA_Trad_15     =Error_LUT15(:,3);
CSA_2stage_15   =Error_LUT15(:,4);

figure(1)       % LUT=45
semilogy(Freq,RCA_New_45,'ko-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
semilogy(Freq,RCA_Trad_45,'k^-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
semilogy(Freq,CSA_2stage_45,'ks:','linewidth',1.2,'MarkerSize',5);
semilogy(Freq(1:34),CSA_3stage_45,'kx:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold off;
axis([420,650,10^(-6),10^5])
legend('RCA: Overclocking','RCA: Truncation','CSA 2-stage','CSA 3-stage','Location','SouthEast');
xlabel('Frequency (MHz)');
ylabel('log(Error Expectation)');
%draw double arrows
ah1=annotation('doublearrow',[.2 .78],[.9 .9]);
ah1_2=annotation('doublearrow',[.78 .88],[.7 .7]);
%tb=annotation('textbox',)

figure(2)       % LUT=35
semilogy(Freq,RCA_New_35,'ko-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
semilogy(Freq,RCA_Trad_35,'k^-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
semilogy(Freq,CSA_2stage_35,'ks:','linewidth',1.2,'MarkerSize',5);
semilogy(Freq(1:34),CSA_3stage_35,'kx:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold off;
axis([420,650,10^(-6),10^5])
legend('RCA: Overclocking','RCA: Truncation','CSA 2-stage','CSA 3-stage','Location','SouthEast');
xlabel('Frequency (MHz)');
ylabel('log(Error Expectation)');
%draw double arrows
ah2_1=annotation('doublearrow',[.2 .5],[.8 .8]);
ah2_2=annotation('doublearrow',[.5 .78],[.55 .55]);
ah2_3=annotation('doublearrow',[.78 .88],[.55 .55]);


figure(3)       % LUT=25
semilogy(Freq,RCA_New_25,'ko-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
semilogy(Freq,RCA_Trad_25,'k^-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
semilogy(Freq,CSA_2stage_25,'ks:','linewidth',1.2,'MarkerSize',5);
semilogy(Freq(1:34),CSA_3stage_25,'kx:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold off;
axis([420,650,10^(-6),10^5])
legend('RCA: Overclocking','RCA: Truncation','CSA 2-stage','CSA 3-stage','Location','SouthEast');
xlabel('Frequency (MHz)');
ylabel('log(Error Expectation)');
%draw double arrows
ah3_1=annotation('doublearrow',[.2 .64],[.84 .84]);
ah3_2=annotation('doublearrow',[.64 .78],[.7 .7]);
ah3_3=annotation('doublearrow',[.78 .88],[.7 .7]);


figure(4)       % LUT=15
semilogy(Freq,RCA_New_15,'ko-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold on;
semilogy(Freq,RCA_Trad_15,'k^-','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
semilogy(Freq,CSA_2stage_15,'ks:','linewidth',1.2,'MarkerSize',5);
%semilogy(Freq(1:34),CSA_3stage_25,'kx:','linewidth',1.2,'MarkerSize',5,'MarkerFaceColor','k');
hold off;
axis([420,650,10^(0),10^5])
legend('RCA: Overclocking','RCA: Truncation','CSA 2-stage','Location','SouthEast');
xlabel('Frequency (MHz)');
ylabel('log(Error Expectation)');
%draw double arrows
ah4_1=annotation('doublearrow',[.2 .88],[.84 .84]);







