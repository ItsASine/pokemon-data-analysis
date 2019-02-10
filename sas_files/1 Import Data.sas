/*
 * Import Pokemon CSV
 */
data pokemon_import;
	infile 
		'path/to/Pokemon.csv'
		delimiter=',' MISSOVER DSD lrecl=32767 firstobs=2;
	informat Number best32.;
	informat Name $27.;
	informat Type1 $8.;
	informat Type2 $8.;
	informat Total best32.;
	informat HP best32.;
	informat Attack best32.;
	informat Defense best32.;
	informat SpecialAtk best32.;
	informat SpecialDef best32.;
	informat Speed best32.;
	informat Generation best32.;
	informat Legendary $5.;
	format Number best12.;
	format Name $27.;
	format Type1 $8.;
	format Type2 $8.;
	format Total best12.;
	format HP best12.;
	format Attack best12.;
	format Defense best12.;
	format SpecialAtk best12.;
	format SpecialDef best12.;
	format Speed best12.;
	format Generation best12.;
	format Legendary $5.;
	input 
		Number 
		Name  $
		Type1  $
		Type2  $
		Total 
		HP 
		Attack 
		Defense 
		SpecialAtk 
		SpecialDef 
		Speed 
		Generation 
		Legendary  $;
run;

/*
 * Ensure the data is sorted by Pokemon number
 */
proc sort data=pokemon_import out=pokemon;
	by number;
run;