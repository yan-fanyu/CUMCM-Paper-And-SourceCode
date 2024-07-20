subplot(1,2,1)
P_FH_K=corr(FH_K,'type','Spearman');
P_FH_K(isnan(P_FH_K))=0;
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_FH_K,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '高钾风化';

P_FH_Pb=corr(FH_Pb,'type','Spearman');
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_FH_Pb,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '铅钡风化';
subplot(1,2,2)
P_NOT_FH_K=corr(NOT_FH_K,'type','Spearman');
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_NOT_FH_K,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '高钾未风化';

P_NOT_FH_Pb=corr(NOT_FH_Pb,'type','Spearman');
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_NOT_FH_Pb,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '铅钡未风化';

P_NOT_FH=abs(abs(P_NOT_FH_K)-abs(P_NOT_FH_Pb));
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_NOT_FH,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '未风化';

P_FH=abs(abs(P_FH_K)-abs(P_FH_Pb));
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_FH,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '风化';

P_K=abs(abs(P_FH_K)-abs(P_NOT_FH_K));
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_K,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '高钾';

P_Pb=abs(abs(P_FH_Pb)-abs(P_NOT_FH_Pb));
xlabel_name = Name;
ylabel_name = Name;
hot_figure = heatmap(xlabel_name,ylabel_name,P_Pb,'FontSize',10);
hot_figure.GridVisible = 'off';
hot_figure.Title = '铅钡';