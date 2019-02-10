/*
 * Look for possibly null or invalid values
 */
proc freq data=pokemon;
	tables number name type1 type2 /nocum nopercent;
run;

proc freq data=pokemon;
	tables total hp attack defense specialatk specialdef speed /nocum;
run;

proc freq data=pokemon;
	tables generation legendary /nocum nopercent;
run;

/* 
 * Check for types that are in one column but not the other
 */
proc sql;
	select type1 from pokemon except select type2 from pokemon;
quit;

proc sql;
	select type2 from pokemon except select type1 from pokemon;
quit;

/*
 * Null out 'NA' Type2s
 */
proc sql;
	update pokemon set type2='' where type2='NA';
quit;

/*
 * Check if one of the 26 updated Pokemon from Gen 7's balance changes
 * were indeed updated
 * https://bulbapedia.bulbagarden.net/wiki/Generation_VII#Alterations_from_Generation_VI
 */
proc sql;
	select number, attack from pokemon where name='Arbok' and attack <> 95;
quit;

/*
 * Update 25 Pokemon via hardcoding using Bulbapedia's updated values
 * The 26th will be removed later as it is a Mega form
 */
data pokemon;
	set pokemon;

	select (name);
		when ('Arbok') 
			do;
				attack=95;
				total=448;
			end;
		when ('Dugtrio') 
			do;
				attack=100;
				total=425;
			end;
		when ("Farfetch'd") 
			do;
				attack=90;
				total=377;
			end;
		when ('Dodrio') 
			do;
				speed=110;
				total=470;
			end;
		when ('Electrode') 
			do;
				speed=150;
				total=490;
			end;
		when ('Exeggutor') 
			do;
				specialdef=75;
				total=530;
			end;
		when ('Noctowl') 
			do;
				specialatk=86;
				total=452;
			end;
		when ('Ariados') 
			do;
				specialdef=70;
				total=400;
			end;
		when ('Qwilfish') 
			do;
				defense=85;
				total=440;
			end;
		when ('Magcargo') 
			do;
				hp=60;
				specialatk=90;
				total=430;
			end;
		when ('Corsola') 
			do;
				hp=65;
				defense=95;
				specialdef=95;
				total=410;
			end;
		when ('Mantine') 
			do;
				hp=85;
				total=485;
			end;
		when ('Swellow') 
			do;
				specialatk=75;
				total=455;
			end;
		when ('Pelipper') 
			do;
				specialatk=95;
				total=440;
			end;
		when ('Masquerain') 
			do;
				specialatk=100;
				speed=80;
				total=454;
			end;
		when ('Delcatty') 
			do;
				speed=90;
				total=400;
			end;

		/*
		 * Volbeat and Illumise are Male/Female of the same line,
		 * so same stats overall and therefore same stat updates
		 */
		when ('Volbeat') 
			do;
				defense=75;
				specialdef=85;
				total=430;
			end;
		when ('Illumise') 
			do;
				defense=75;
				specialdef=85;
				total=430;
			end;

		/*
		 * Similarly, Lunatone and Solrock are paired together
		 * due to their game exclusiveness (Sapphire and Ruby, resp)
		 * meaning one or the other per game
		 */
		when ('Lunatone') 
			do;
				hp=90;
				total=460;
			end;
		when ('Solrock') 
			do;
				speed=90;
				total=460;
			end;

		when ('Chimecho') 
			do;
				hp=75;
				defense=80;
				specialdef=90;
				total=455;
			end;
		when ('Woobat') 
			do;
				hp=65;
				total=323;
			end;
		when ('Crustle') 
			do;
				attack=105;
				total=485;
			end;
		when ('Beartic') 
			do;
				attack=130;
				total=505;
			end;
		when ('Cryogonal') 
			do;
				hp=80;
				defense=50;
				total=515;
			end;
		otherwise ;
	end;
run;

/*
 * Attempt to fix the display of special characters in names
 * The charset of the SAS Studio instance appears to not allow gender signs
 * regardless of the below fix
 */
data pokemon;
	set pokemon;

	/* Female Sign */
	name=tranwrd(name, 'â™€', '2640'x);

	/* Male Sign */
	name=tranwrd(name, 'â™‚', '2642'x);

	/* Acute e */
	name=tranwrd(name, 'Ã©', '00E9'x);
run;

proc compare base=pokemon_import compare=pokemon nosummary;
   var name total hp attack defense specialatk specialdef speed;
   with name total hp attack defense specialatk specialdef speed;
   title 'Comparison of Variables in Original and Cleaned Set';
run;

/*
 * Find duplicate values
 * This will look for Pokemon with multiple forms (via the same Pokdex number)
 */
proc sql;
	select number, count(number) as c from pokemon group by number having c gt 1;
quit;

/*
 * Remove duplicate values to only use base Pokemon
 */
proc sort data=pokemon nodupkey;
	by number;
run;

proc print data=pokemon;
run;