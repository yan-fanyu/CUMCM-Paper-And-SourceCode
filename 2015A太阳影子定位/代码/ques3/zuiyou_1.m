clc;
clear;

% Φ -> A   纬度
% δ -> F   太阳赤道纬度夹角
% ω -> C   太阳时角
%  h -> Oh  太阳高度角
% λ -> D   经度

Fs = [0.918623526	0.944000767	0.966801009	0.994166838	1.012283158	1.046853791	1.071045389	1.097061852	1.127405199	1.159996144	1.191548883	1.225531726	1.254788569	1.290149918	1.331772011	1.362830448	1.399931432	1.446251384	1.481107264	1.522542777];



FsArr = [
    0.718578797	0.733382552	0.748746948	0.764690387	0.781231337	0.798388226	0.816179307	0.834622505	0.85373524	0.873534213	0.894035175	0.915252647	0.937199616	0.959887176	0.983324139	1.007516588	1.032467392	1.058175659	1.084636143	1.111838606
0.686999211	0.700565716	0.714630377	0.729209006	0.744317502	0.759971765	0.776187602	0.792980606	0.810366025	0.828358609	0.846972426	0.866220667	0.88611541	0.906667363	0.927885568	0.949777079	0.972346592	0.99559605	1.019524197	1.044126097
0.829657201	0.849114698	0.86934603	0.89037576	0.912227884	0.934925534	0.958490635	0.9829435	1.008302366	1.034582864	1.061797418	1.089954562	1.119058177	1.149106647	1.180091918	1.21199848	1.244802264	1.278469465	1.312955298	1.348202726
0.800063833	0.819138381	0.838945312	0.85950628	0.880842244	0.902973178	0.925917744	0.949692908	0.974313511	0.99979177	1.026136729	1.053353631	1.081443225	1.110401007	1.140216378	1.17087174	1.202341526	1.234591166	1.267576022	1.30124028
0.684818578	0.699406344	0.714514576	0.73015869	0.746353979	0.763115498	0.780457935	0.798395452	0.816941513	0.836108683	0.855908404	0.876350733	0.897444063	0.919194799	0.941607003	0.964682006	0.988417975	1.012809451	1.037846841	1.063515882
0.845459627	0.864429717	0.884177401	0.904729656	0.926113254	0.948354504	0.971478948	0.995510999	1.020473525	1.04638736	1.073270745	1.101138694	1.130002259	1.159867724	1.190735681	1.222600021	1.255446825	1.289253149	1.323985733	1.359599629
0.91707391	0.939303965	0.962461544	0.986576913	1.01167935	1.037796685	1.064954767	1.093176835	1.122482798	1.15288841	1.184404326	1.217035044	1.25077772	1.28562085	1.321542832	1.358510409	1.396477005	1.435380979	1.475143833	1.515668408
0.840665072	0.861372223	0.882886199	0.905230081	0.928425862	0.952494065	0.977453309	1.003319803	1.030106783	1.057823865	1.086476318	1.116064263	1.146581781	1.178015936	1.210345717	1.243540912	1.277560903	1.312353428	1.347853307	1.383981179
0.90001369	0.920963968	0.942795521	0.965539128	0.989225094	1.013882884	1.039540697	1.06622496	1.093959747	1.122766094	1.152661223	1.183657651	1.215762186	1.248974796	1.283287356	1.318682272	1.355130973	1.392592311	1.431010856	1.470315135
0.653099563	0.6656937	0.678732847	0.692230485	0.70620016	0.72065542	0.735609729	0.751076381	0.767068395	0.783598389	0.80067845	0.81831997	0.836533471	0.855328408	0.87471294	0.894693686	0.915275443	0.936460885	0.958250225	0.980640853
0.718157258	0.73435505	0.75114847	0.768555455	0.786593689	0.805280441	0.824632378	0.844665344	0.865394114	0.886832113	0.908991087	0.93188075	0.955508372	0.97987833	1.004991608	1.030845248	1.057431751	1.084738432	1.112746723	1.141431446
0.684103604	0.697333147	0.711054634	0.725284159	0.740037986	0.755332471	0.771183977	0.787608772	0.804622905	0.822242073	0.840481456	0.859355531	0.878877864	0.899060867	0.919915527	0.941451099	0.963674767	0.986591257	1.010202424	1.034506785
0.762787485	0.781173212	0.800234976	0.819991334	0.840460094	0.861658053	0.883600706	0.906301905	0.929773481	0.954024807	0.979062321	1.004888987	1.031503702	1.058900646	1.087068578	1.115990069	1.145640696	1.175988187	1.206991535	1.238600091
0.873502326	0.894638277	0.916616304	0.939461423	0.963197572	0.987847211	1.013430854	1.039966535	1.06746919	1.09594997	1.125415449	1.155866752	1.187298584	1.219698162	1.253044056	1.287304944	1.322438289	1.358388969	1.395087867	1.432450467
0.602821594	0.611138657	0.619778532	0.628752508	0.638072274	0.647749922	0.657797946	0.668229237	0.679057077	0.690295127	0.70195741	0.714058291	0.726612451	0.739634849	0.753140684	0.767145341	0.78166433	0.796713211	0.81230751	0.828462614
0.649813283	0.66206754	0.674761838	0.687909995	0.701525971	0.715623811	0.730217577	0.745321268	0.760948726	0.777113529	0.793828869	0.811107405	0.828961109	0.847401075	0.866437318	0.886078539	0.906331867	0.927202572	0.948693745	0.970805951
0.900200755	0.922219467	0.945134415	0.968972963	0.993761295	1.019523957	1.046283328	1.074059011	1.102867128	1.132719526	1.163622877	1.195577668	1.228577084	1.262605773	1.297638518	1.333638791	1.370557245	1.408330127	1.446877681	1.486102555
0.815632812	0.833718976	0.852537086	0.872112445	0.892470249	0.91363537	0.935632099	0.958483839	0.982212749	1.006839335	1.032381971	1.058856358	1.086274904	1.114646027	1.143973374	1.174254951	1.205482161	1.237638764	1.27069974	1.304630091
0.669612542	0.68134203	0.693526538	0.706182394	0.719326342	0.732975512	0.747147373	0.761859685	0.777130428	0.792977731	0.809419769	0.826474661	0.844160329	0.86249435	0.881493775	0.901174923	0.92155314	0.942642531	0.964455651	0.987003154
0.78115175	0.797871098	0.815257752	0.833334926	0.852125898	0.871653838	0.89194162	0.913011589	0.934885293	0.95758317	0.981124184	1.005525411	1.030801563	1.056964448	1.084022362	1.111979412	1.140834755	1.170581771	1.20120715	1.23268991
0.622943074	0.634169109	0.645779751	0.657786238	0.670199895	0.683032089	0.696294177	0.709997441	0.724153019	0.738771821	0.753864436	0.769441025	0.7855112	0.802083892	0.819167194	0.836768194	0.854892787	0.873545469	0.892729102	0.912444668
0.724107044	0.740687388	0.757864825	0.775656166	0.794077793	0.813145471	0.83287414	0.853277681	0.874368637	0.896157909	0.918654414	0.941864694	0.965792488	0.990438263	1.01579869	1.041866082	1.068627785	1.096065526	1.124154724	1.152863773
0.657779818	0.670204777	0.683068288	0.696383534	0.71016376	0.724422211	0.739172055	0.754426298	0.770197677	0.786498549	0.803340756	0.820735473	0.838693037	0.857222758	0.876332702	0.896029448	0.916317827	0.937200628	0.958678271	0.980748465
0.911444163	0.934109364	0.957683718	0.982192921	1.00766109	1.034110246	1.061559731	1.090025526	1.119519485	1.150048469	1.181613369	1.214208032	1.24781807	1.282419575	1.31797773	1.354445341	1.391761313	1.429849094	1.468615126	1.507947365
0.994205449	1.019944214	1.046761428	1.074687802	1.103751606	1.133977901	1.165387659	1.197996736	1.231814719	1.26684362	1.303076408	1.340495399	1.379070483	1.418757228	1.459494853	1.501204133	1.543785264	1.587115763	1.631048488	1.675409872
0.680454101	0.69330393	0.706636804	0.720468939	0.734816793	0.749696997	0.765126284	0.781121401	0.797699001	0.81487552	0.832667036	0.851089103	0.870156558	0.889883305	0.910282067	0.931364105	0.953138901	0.975613804	0.998793638	1.022680265
0.623377741	0.633561082	0.644108906	0.65503261	0.666343814	0.678054333	0.690176141	0.702721334	0.715702084	0.729130586	0.743018988	0.757379324	0.772223427	0.787562829	0.803408651	0.81977148	0.83666122	0.854086937	0.872056676	0.890577259
0.619106174	0.628374964	0.637987215	0.647954192	0.658287466	0.668998902	0.680100641	0.691605078	0.703524836	0.71587273	0.728661732	0.741904916	0.75561541	0.769806321	0.784490665	0.799681271	0.815390682	0.831631037	0.848413933	0.865750272
0.656366568	0.668225805	0.680512317	0.693239498	0.706420905	0.720070201	0.734201099	0.74882729	0.763962357	0.779619681	0.795812328	0.812552919	0.82985349	0.84772532	0.866178745	0.885222951	0.904865734	0.925113237	0.945969664	0.967436955
0.645278939	0.656893449	0.668936323	0.681421742	0.694364145	0.707778193	0.721678716	0.736080652	0.750998977	0.766448619	0.78244436	0.799000724	0.816131838	0.833851288	0.85217194	0.871105742	0.890663506	0.910854653	0.93168693	0.953166102
0.599744102	0.607737123	0.616020928	0.624604446	0.633496852	0.642707559	0.65224621	0.662122663	0.672346978	0.682929395	0.69388031	0.705210247	0.716929825	0.729049717	0.741580603	0.754533117	0.767917785	0.781744953	0.796024707	0.810766777
0.540901189	0.556992391	0.573604723	0.590752912	0.608451306	0.626713734	0.645553332	0.664982355	0.685011957	0.705651951	0.726910532	0.748793977	0.771306301	0.794448893	0.8182201	0.842614794	0.867623886	0.893233821	0.919426032	0.946176376
0.782384653	0.799469172	0.817235121	0.835705997	0.854905296	0.874856334	0.895582034	0.917104679	0.939445619	0.962624932	0.98666104	1.011570254	1.037366271	1.064059592	1.091656879	1.120160229	1.149566372	1.179865797	1.211041787	1.243069401
0.682435409	0.69504511	0.708129251	0.72170377	0.735784858	0.750388897	0.765532397	0.781231903	0.797503908	0.814364729	0.831830379	0.849916407	0.868637723	0.888008391	0.908041393	0.92874837	0.950139318	0.972222258	0.995002857	1.018484021
0.54891544	0.565044154	0.581698815	0.598894345	0.616645296	0.634965694	0.653868879	0.673367302	0.693472311	0.7141939	0.735540437	0.757518347	0.780131779	0.80338222	0.827268086	0.851784269	0.876921655	0.902666598	0.929000375	0.955898601
0.621221652	0.632154902	0.643469017	0.65517548	0.667285914	0.679812047	0.692765664	0.70615855	0.720002432	0.734308897	0.749089319	0.764354751	0.780115825	0.796382621	0.81316453	0.830470097	0.848306842	0.86668107	0.885597646	0.905059765
0.594009995	0.613501606	0.633669246	0.65453172	0.676106947	0.698411672	0.721461148	0.745268766	0.769845641	0.79520014	0.821337368	0.848258583	0.875960558	0.904434888	0.933667234	0.963636512	0.994314042	1.025662645	1.057635724	1.090176335
0.869864841	0.891279111	0.913553507	0.936714043	0.960785653	0.98579178	1.011753887	1.038690905	1.06661859	1.095548802	1.125488686	1.156439754	1.188396871	1.221347132	1.255268647	1.290129233	1.325885023	1.362479021	1.399839617	1.437879114
0.669839833	0.68157815	0.693771805	0.706437134	0.719590891	0.733250211	0.74743257	0.762155733	0.777437685	0.793296554	0.809750518	0.826817691	0.844515992	0.862862988	0.881875719	0.901570485	0.921962612	0.943066177	0.964893701	0.987455796
0.718217717	0.734921591	0.752227839	0.770153565	0.788715436	0.807929504	0.827810989	0.848374038	0.869631446	0.891594346	0.914271854	0.937670676	0.961794671	0.986644366	1.012216426	1.038503077	1.065491485	1.093163085	1.12149288	1.150448702
0.639712589	0.653487103	0.667725285	0.682439944	0.697643728	0.713349024	0.729567847	0.746311712	0.763591494	0.78141726	0.799798085	0.818741853	0.83825502	0.85834237	0.879006726	0.900248652	0.922066114	0.944454124	0.967404344	0.990904683
0.635367302	0.645626736	0.656281356	0.667345214	0.678832784	0.690758951	0.703138984	0.715988514	0.7293235	0.743160184	0.757515041	0.772404712	0.787845933	0.803855441	0.820449865	0.837645607	0.855458693	0.873904605	0.892998087	0.912752928
0.72270107	0.737585034	0.753027678	0.769046902	0.785660616	0.802886621	0.820742473	0.839245323	0.858411732	0.878257456	0.898797202	0.92004435	0.942010631	0.96470578	0.988137128	1.012309161	1.03722303	1.062876006	1.089260893	1.116365388
0.61929144	0.629110217	0.639286864	0.649832912	0.660760165	0.672080678	0.683806733	0.695950804	0.708525527	0.721543647	0.735017972	0.748961305	0.763386376	0.778305757	0.793731764	0.809676347	0.826150963	0.843166434	0.860732783	0.878859052
0.767147701	0.785343615	0.804207171	0.823756587	0.844009347	0.864981952	0.886689635	0.909146025	0.932362788	0.956349197	0.981111672	1.006653256	1.03297304	1.060065536	1.087919985	1.116519627	1.145840909	1.175852656	1.206515215	1.237779568
0.647332464	0.660055284	0.673228057	0.686864538	0.700978548	0.715583914	0.730694381	0.746323525	0.762484643	0.779190627	0.796453826	0.814285883	0.832697553	0.851698496	0.871297053	0.89149998	0.91231217	0.933736337	0.955772669	0.978418454
0.848430885	0.869611824	0.89160371	0.914427948	0.938104547	0.962651701	0.988085315	1.014418464	1.04166078	1.06981777	1.098890045	1.12887248	1.159753285	1.191513005	1.224123441	1.257546513	1.291733073	1.32662169	1.362137441	1.398190726
0.619077824	0.63071947	0.642752481	0.655187964	0.668037053	0.681310857	0.695020396	0.70917653	0.723789876	0.738870715	0.754428886	0.770473665	0.787013632	0.80405652	0.821609044	0.839676722	0.858263661	0.877372338	0.89700335	0.917155146
0.869450507	0.890848062	0.91310522	0.936248014	0.960301403	0.985288864	1.011231904	1.038149508	1.066057504	1.094967835	1.124887749	1.155818878	1.187756229	1.220687061	1.254589674	1.289432103	1.325170724	1.361748814	1.399095067	1.437122118
0.558204627	0.574385503	0.591095873	0.608350659	0.626164393	0.644551068	0.66352396	0.683095435	0.703276725	0.724077671	0.745506449	0.76756925	0.790269934	0.813609646	0.837586395	0.862194603	0.887424603	0.913262121	0.939687717	0.966676198
0.617130142	0.636876395	0.657306072	0.678437323	0.700287262	0.722871673	0.746204658	0.770298254	0.795161995	0.820802416	0.847222511	0.87442113	0.902392313	0.931124577	0.960600137	0.990794083	1.021673514	1.053196635	1.085311843	1.11795681
0.991712772	1.017395203	1.044158165	1.072033001	1.101048702	1.131231152	1.162602243	1.19517887	1.228971776	1.263984253	1.300210681	1.337634912	1.376228504	1.415948805	1.456736923	1.498515604	1.541187071	1.584630887	1.628701919	1.673228517
0.687432399	0.700721466	0.714500682	0.728785764	0.743592555	0.758936947	0.774834784	0.791301766	0.808353314	0.826004433	0.844269547	0.863162305	0.882695369	0.902880172	0.923726635	0.945242868	0.967434818	0.990305895	1.013856544	1.038083792
0.71467473	0.728494906	0.742846747	0.75774851	0.773218687	0.789275931	0.805938954	0.823226416	0.841156784	0.859748177	0.879018178	0.89898362	0.91966034	0.941062895	0.963204242	0.986095373	1.009744911	1.034158646	1.059339038	1.085284648
0.6440843	0.657493477	0.67136348	0.685707601	0.700539062	0.715870928	0.731716009	0.748086745	0.764995071	0.782452271	0.80046881	0.819054139	0.838216487	0.857962621	0.878297581	0.899224392	0.920743742	0.942853636	0.965549017	0.98882136
0.608155435	0.616609826	0.625388981	0.634504076	0.643966668	0.653788687	0.663982443	0.674560606	0.685536204	0.696922605	0.708733495	0.720982854	0.733684925	0.746854171	0.760505229	0.77465285	0.789311835	0.804496948	0.820222826	0.836503867
0.55692598	0.57455814	0.59278919	0.611636827	0.631118274	0.651250073	0.672047868	0.693526143	0.715697927	0.738574468	0.762164857	0.786475608	0.811510199	0.837268561	0.863746512	0.890935154	0.918820214	0.947381341	0.976591371	1.006415552
0.599123862	0.607644316	0.616468847	0.625606669	0.635067221	0.644860153	0.654995311	0.665482721	0.676332562	0.68755514	0.699160855	0.711160163	0.72356353	0.736381383	0.749624047	0.763301677	0.777424182	0.792001133	0.807041665	0.822554364
0.749243173	0.768601957	0.788657615	0.809427831	0.830929219	0.853177005	0.87618469	0.899963644	0.924522672	0.94986751	0.976000279	1.002918872	1.03061629	1.059079921	1.08829076	1.118222587	1.1488411	1.180103019	1.211955178	1.24433362
0.618824319	0.62835807	0.638242524	0.648489106	0.659109533	0.670115797	0.681520146	0.693335059	0.705573212	0.71824744	0.73137069	0.74495597	0.759016283	0.77356455	0.788613528	0.804175708	0.820263202	0.836887611	0.854059879	0.871790124
0.754952577	0.774186999	0.794113333	0.814749036	0.836110505	0.858212766	0.881069141	0.90469085	0.929086582	0.954262003	0.980219216	1.006956159	1.034465956	1.062736206	1.091748218	1.121476203	1.151886424	1.182936315	1.214573587	1.246735343
0.580208664	0.587385436	0.594856238	0.602631951	0.610723924	0.619143988	0.627904472	0.63701821	0.646498559	0.656359401	0.666615158	0.677280792	0.688371808	0.699904252	0.711894707	0.724360282	0.737318591	0.750787732	0.764786253	0.779333111
0.598828372	0.607605213	0.616691637	0.626096916	0.635830531	0.645902152	0.656321624	0.667098941	0.678244219	0.689767667	0.701679544	0.713990122	0.726709628	0.739848191	0.753415775	0.767422097	0.781876547	0.796788087	0.812165143	0.828015479
0.634959959	0.645491185	0.656426344	0.667779747	0.679566117	0.69180057	0.704498593	0.71767601	0.731348945	0.74553377	0.760247048	0.775505459	0.791325716	0.807724465	0.824718164	0.842322947	0.860554461	0.879427687	0.898956724	0.91915455
0.764273683	0.780977702	0.798314263	0.816302893	0.834962864	0.854313011	0.874371522	0.895155695	0.91668166	0.938964058	0.962015682	0.985847061	1.010466005	1.03587709	1.062081087	1.089074337	1.11684807	1.145387662	1.174671844	1.204671864
0.537005461	0.551603784	0.566662879	0.582195623	0.598214659	0.614732279	0.631760307	0.64930996	0.667391685	0.686014985	0.705188222	0.724918386	0.74521086	0.766069137	0.787494527	0.809485832	0.832038987	0.855146682	0.878797954	0.902977756
0.722573362	0.737452521	0.752890203	0.768904309	0.785512749	0.802733324	0.820583594	0.839080715	0.858241254	0.878080974	0.898614593	0.919855503	0.941815452	0.964504193	0.987929081	1.012094629	1.037002019	1.062648557	1.089027091	1.116125365
0.903358781	0.924363784	0.946246334	0.969036441	0.992763546	1.017456145	1.04314136	1.069844417	1.097588063	1.126391873	1.156271464	1.187237608	1.219295215	1.252442218	1.286668314	1.321953603	1.358267104	1.395565171	1.433789833	1.472867072
0.52471407	0.540646665	0.557102218	0.574096427	0.591644736	0.609762192	0.628463296	0.647761816	0.667670585	0.68820127	0.709364107	0.731167606	0.753618228	0.776720017	0.8004742	0.824878746	0.849927892	0.875611623	0.901915123	0.928818187
0.738216613	0.752740489	0.767841684	0.78354109	0.799859931	0.816819677	0.834441934	0.852748313	0.871760275	0.891498947	0.911984905	0.933237923	0.955276678	0.978118419	1.001778576	1.026270326	1.051604097	1.077787011	1.104822266	1.132708445
0.727947641	0.74324618	0.759111219	0.775560177	0.792610355	0.810278805	0.828582177	0.847536534	0.867157148	0.887458262	0.908452823	0.930152171	0.9525657	0.975700472	0.999560787	1.024147712	1.049458562	1.075486331	1.102219082	1.12963929
0.801949296	0.818987352	0.836724157	0.85518531	0.874396606	0.894383874	0.915172776	0.936788574	0.959255847	0.982598162	1.006837695	1.031994785	1.058087421	1.085130662	1.113135975	1.142110484	1.172056139	1.202968786	1.234837151	1.26764173
0.602895061	0.612540658	0.622509254	0.632809824	0.643451445	0.654443272	0.665794499	0.677514325	0.689611908	0.702096317	0.714976471	0.728261078	0.741958558	0.756076961	0.770623874	0.785606317	0.801030628	0.816902333	0.833226007	0.850005117
0.787679545	0.805526389	0.824077736	0.843356863	0.863386833	0.884190276	0.905789141	0.928204394	0.951455681	0.97556093	1.0005359	1.026393667	1.053144041	1.080792916	1.109341542	1.13878572	1.169114922	1.200311335	1.232348837	1.265191903
0.889590505	0.910994068	0.933281137	0.956480548	0.980620315	1.00572723	1.031826388	1.058940638	1.087089945	1.116290664	1.146554704	1.177888597	1.210292444	1.243758749	1.278271138	1.313802964	1.350315817	1.387757941	1.426062597	1.465146402
0.67511432	0.688132594	0.70164298	0.715662252	0.730207443	0.745295784	0.76094463	0.777171362	0.793993286	0.811427503	0.82949076	0.848199282	0.867568572	0.887613185	0.908346467	0.929780269	0.95192461	0.974787311	0.998373579	1.022685553
0.76960631	0.785356263	0.801742766	0.818789078	0.836518747	0.854955488	0.874123037	0.894044969	0.914744494	0.936244206	0.958565797	0.981729714	1.005754779	1.030657737	1.056452746	1.083150806	1.110759107	1.139280302	1.168711709	1.199044423
0.786177323	0.80301502	0.820519161	0.838712384	0.857617297	0.877256316	0.897651458	0.918824097	0.940794692	0.963582456	0.987204988	1.011677846	1.037014058	1.063223577	1.090312662	1.118283195	1.147131922	1.176849617	1.20742018	1.238819666
0.537061665	0.551661764	0.566722686	0.582257308	0.598278269	0.614797862	0.631827909	0.649379622	0.667463447	0.686088883	0.705264284	0.724996639	0.745291319	0.766151812	0.78757942	0.809572932	0.832128271	0.855238115	0.878891487	0.90307332
0.781140457	0.798175226	0.81588968	0.834307313	0.853451624	0.873345951	0.894013254	0.915475873	0.937755237	0.960871533	0.984843321	1.009687085	1.035416735	1.062043032	1.089572948	1.118008944	1.147348181	1.177581642	1.208693183	1.240658509
0.75752161	0.774057025	0.791225304	0.809046674	0.827541204	0.846728644	0.866628219	0.887258403	0.908636648	0.930779081	0.953700155	0.977412246	1.001925213	1.027245888	1.05337752	1.080319156	1.10806496	1.136603476	1.165916825	1.195979861
0.708072671	0.725546187	0.743635729	0.762357654	0.781727658	0.801760554	0.82247003	0.843868362	0.8659661	0.88877171	0.912291178	0.936527568	0.961480533	0.987145786	1.013514518	1.040572779	1.068300809	1.096672343	1.125653877	1.155203922
0.591932269	0.611390918	0.631527529	0.652361291	0.673910545	0.696192508	0.719222952	0.74301584	0.767582914	0.792933226	0.819072624	0.846003169	0.873722501	0.902223137	0.931491717	0.961508191	0.992244951	1.023665931	1.055725665	1.088368345
0.604877918	0.624484478	0.644771223	0.665756746	0.687458693	0.709893473	0.733075926	0.757018943	0.781733044	0.807225898	0.833501787	0.860561022	0.888399287	0.917006933	0.946368214	0.976460469	1.007253253	1.038707444	1.070774312	1.103394593
0.825920594	0.844607576	0.864040615	0.884244167	0.905242336	0.927058619	0.949715604	0.973234627	0.997635363	1.022935363	1.049149525	1.076289491	1.104362967	1.133372968	1.16331697	1.194185988	1.225963561	1.258624665	1.292134549	1.326447523
0.57593857	0.593798201	0.612253467	0.631320573	0.651015051	0.671351552	0.692343601	0.714003323	0.736341128	0.759365368	0.783081941	0.807493866	0.832600801	0.85839853	0.88487839	0.912026673	0.939823971	0.968244496	0.997255371	1.026815901
0.688982267	0.703900665	0.719340748	0.735317105	0.75184407	0.768935601	0.786605125	0.804865373	0.823728191	0.843204317	0.863303142	0.884032435	0.905398039	0.927403537	0.950049878	0.973334973	0.997253258	1.021795215	1.046946866	1.072689238
0.706396256	0.724041428	0.742301617	0.761192578	0.78072931	0.800925838	0.821794951	0.843347913	0.865594138	0.888540821	0.912192533	0.936550772	0.961613468	0.987374444	1.013822832	1.040942454	1.068711154	1.097100105	1.126073092	1.155585781
0.891551813	0.91482588	0.938998979	0.964092838	0.990127026	1.017118386	1.045080392	1.074022413	1.103948895	1.134858441	1.166742806	1.199585786	1.233362022	1.268035725	1.303559325	1.339872081	1.376898674	1.41454781	1.452710906	1.49126089
0.753335773	0.768866464	0.78500006	0.801756869	0.819157267	0.837221579	0.855969918	0.875422007	0.895596966	0.916513071	0.938187467	0.960635847	0.98387208	1.007907797	1.032751914	1.058410109	1.084884236	1.112171675	1.140264628	1.169149347
0.691765944	0.705440469	0.719612562	0.73429763	0.749511112	0.765268392	0.781584691	0.798474952	0.815953693	0.834034853	0.852731599	0.872056125	0.892019412	0.912630959	0.933898488	0.955827609	0.978421456	1.001680275	1.025600988	1.050176711
0.714031566	0.7313905	0.749361205	0.767959823	0.787201838	0.807101861	0.827673389	0.848928526	0.870877669	0.893529162	0.916888901	0.940959903	0.965741825	0.991230442	1.017417081	1.044288005	1.071823767	1.099998515	1.128779283	1.15812525
0.640350808	0.658562758	0.677392046	0.696854474	0.716965004	0.737737526	0.759184582	0.781317059	0.804143846	0.827671449	0.851903563	0.876840597	0.902479159	0.928811494	0.955824876	0.983500959	1.011815092	1.040735606	1.070223075	1.100229574
0.571227989	0.589028048	0.607429117	0.62644826	0.64610196	0.66640591	0.687374774	0.709021924	0.731359125	0.754396197	0.778140623	0.802597124	0.827767179	0.853648504	0.880234482	0.907513545	0.935468515	0.964075901	0.993305164	1.023117964
];



% 10月22日北京时间9:00-15:00

% 285	1.4	-32	69



NLWJ = [285	1.4	-32	69
65	1.3	-31	74
114	1.7	34	77
245	1.6	30	77
85	1.3	27	74
26	1.8	-39	80
199	2	40	81
58	1.7	-31	82
175	2	42	79
271	1.2	-29	67
257	1.4	27	73
283	1.3	-32	67
76	1.5	-26	79
226	1.8	35	80
42	1.1	-38	65
92	1.2	30	70
34	1.9	-37	83
308	1.7	-37	72
298	1.3	-36	64
120	1.6	36	74
268	1.1	-29	65
78	1.4	-26	77
71	1.2	-30	72
306	1.9	-36	76
186	2.2	41	83
104	1.3	33	70
281	1.1	-33	62
235	1.1	36	64
247	1.2	32	68
63	1.2	-32	71
53	1	-37	64
192	1.3	-4	75
299	1.6	-35	71
55	1.3	-34	73
146	1.3	-5	73
89	1.1	30	68
364	1.5	1	78
229	1.8	34	80
229	1.3	36	69
264	1.4	-25	73
71	1.2	23	74
114	1.2	36	65
102	1.4	32	73
285	1.1	-34	61
271	1.5	-27	74
76	1.2	-28	72
244	1.7	30	79
265	1.1	27	66
298	1.8	-34	75
141	1.3	-6	73
197	1.5	-3	79
3	2.2	-41	83
100	1.3	32	71
232	1.4	35	72
77	1.2	25	73
119	1.1	38	61
159	1.4	-2	75
60	1	-35	65
272	1.5	21	75
106	1.1	35	64
87	1.5	-22	79
28	1.1	-40	62
246	1	34	62
293	1.2	-35	62
241	1.5	32	75
137	1.2	-8	71
60	1.4	-32	76
361	2	-42	79
158	1.3	-3	73
305	1.5	-37	68
246	1.4	31	73
135	1.7	39	74
257	1	31	63
292	1.6	-33	72
133	1.9	38	78
243	1.3	32	70
216	1.6	38	75
225	1.6	36	76
25	1.2	8	75
228	1.6	35	76
58	1.5	-32	78
274	1.4	21	73
162	1.5	-1	77
336	1.5	2	75
121	1.7	36	76
191	1.4	-3	77
264	1.3	-26	71
277	1.4	20	73
60	1.8	-30	84
114	1.5	35	73
279	1.3	-31	68
89	1.4	-22	77
39	1.4	10	80
152	1.4	-3	75
234	1.3	-15	75
287	1.3	-33	66
209	1.1	40	60
274	1.3	22	71
300	1.7	-35	73
102	1	35	62
97	1.1	-22	70
324	1.8	-40	73
100	1.1	-21	70
260	1.2	-25	69
26	1.3	7	77
102	1.8	30	81
224	1.7	36	78
358	1.6	0	79
260	1.3	27	71
330	1.4	4	73
126	1.7	37	75
42	1.2	13	76
143	1.5	-4	77
334	1.3	4	71
246	1.1	33	65
78	1	-30	67
59	1.6	-31	80
134	1.5	-6	77

];

nArr = NLWJ(:, 1);
LArr = NLWJ(:, 2);
WArr = NLWJ(:, 3);
JArr = NLWJ(:, 4);
%     24 7
ii = 24;

Fsi = FsArr(ii, :); 

n = 199;

L = 2;

W = 40.1;

J = 81.1;

hour = [12	12	12	12	12	12	12	13	13	13	13	13	13	13	13	13	13	13	13	13	13];
minutes = [41	44	47	50	53	56	59	2	5	8	11	14	17	20	23	26	29	32	35	38	41];

dLs = [1.247256205	1.22279459	1.198921486	1.175428964	1.152439573	1.12991747	1.10783548	1.086254206	1.065081072	1.044446265	1.024264126	1.004640314	0.985490908	0.966790494	0.948584735	0.930927881	0.91375175	0.897109051	0.880973762	0.865492259	0.850504468];

% 时区经度
Jm = 120;

% 太阳赤纬夹角（度）
C = 23.45*sin(2*pi*(284+n)/365);

% 太阳时
B = 2*pi*(n -81)/364;
E = 9.87*sin(2*B) - 7.53*cos(B) - 1.5*sin(B); 

LsArr = [];

X = [];

for i=1:1:21
    
    T0 = hour(i) + minutes(i)/60;
    
    Ts = T0 + E/60 + (J - Jm)/15;
    
    X(i)  = T0;
    
    % 太阳时角（度）
    S = 15*(Ts - 12);


    % 太阳高度角
    Oh = asin(sin(W*pi/180)*sin(C*pi/180) + cos(W*pi/180)*cos(C*pi/180)*cos(S*pi/180));


    % 影长 Ls
    Ls = L/tan(Oh);
    LsArr(i) = Ls;
 
end



plot(X(:, 1:20), Fs, '.');
hold on;
plot(X(:, 1:20), Fsi, 'blue');

xlabel('时间');
ylabel('方位角之差（°）');
title('7月18日 杆长2米 （40.1°N，81.1°E）');

legend('实际值', '预测值')





