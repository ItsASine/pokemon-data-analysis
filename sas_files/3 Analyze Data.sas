/*
 * Correlation Coefficients for all numeric fields
 */
Title 'Correlation Coefficients for all numeric fields';
ods noproctitle;
ods graphics / imagemap=on;

proc corr data=WORK.POKEMON pearson nosimple noprob plots=none;
	var HP Defense Attack SpecialAtk SpecialDef Speed Total Generation;
	with HP Defense Attack SpecialAtk SpecialDef Speed Total Generation;
run;

/*
 * Summary Statistics for Total by Type
 */
Title 'Summary Statistics for Total by Type';
ods noproctitle;
ods graphics / imagemap=on;

proc means data=WORK.POKEMON chartype mean median std min max n vardef=df;
	var Total;
	class Type1 Type2;
run;

/*
 * Summary Statistics for Total by Generation
 */
Title 'Summary Statistics for Total by Generation';
ods noproctitle;
ods graphics / imagemap=on;

proc means data=WORK.POKEMON chartype mean median std min max n vardef=df;
	var Total;
	class Generation;
run;

/*
 * T Test for Total and Legendary status
 */
Title 'T Test for Total and Legendary status';
ods noproctitle;
ods graphics / imagemap=on;

proc ttest data=WORK.POKEMON sides=2 h0=0 plots(showh0);
	class Legendary;
	var Total;
run;

/*
 * ANOVA for Total and Type1
 */
Title 'ANOVA for Total and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model Total=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for HP and Type1
 */
Title 'ANOVA for HP and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model HP=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for Defense and Type1
 */
Title 'ANOVA for Defense and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model Defense=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for Attack and Type1
 */
Title 'ANOVA for Attack and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model Attack=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for SpecialAtk and Type1
 */
Title 'ANOVA for SpecialAtk and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model SpecialAtk=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for SpecialDef and Type1
 */
Title 'ANOVA for SpecialDef and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model SpecialDef=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;

/*
 * ANOVA for Speed and Type1
 */
Title 'ANOVA for Speed and Type1';
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.POKEMON;
	class Type1;
	model Speed=Type1;
	means Type1 / hovtest=levene welch plots=none;
	lsmeans Type1 / adjust=tukey pdiff alpha=.05;
	run;
quit;
