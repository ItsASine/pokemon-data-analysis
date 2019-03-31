# pokemon-data-analysis
SAS analysis using Pokemon as a dataset

## Data

* Source data ([Pokemon.csv]) is from the [pokemonData][local-pokemon] repo which was a fork from this [pokemonData repo][github-pokemon] which is an extension of this [Kaggle dataset][kaggle-pokemon]
* Cleaned data ([pokemon_clean.csv]) which is the result of running [Clean Data] on [Pokemon.csv]

### Variables

13: Pokedex Number, Name, Type1, Type2, Total, HP, Attack, Defense, Sp. Attack, Sp. Def, Speed, Generation, Legendary

## SAS Code

1. [Import Data], which needs updated to point to the specific path of [Pokemon.csv]
    * Apparently relative paths aren't really a thing in SAS due to the runtime quirks of SAS Studio
        * It puts things in a tmp folder, so you can never be too sure of what the path actually is going to be
        * To me, that sounds like the exact use case for relative paths, but the SAS Community forums say that is not the case
    * The data does need to be explicitly imported rather than using SAS Studio shortcuts as it was not interpreting Type1 as an 8 length column
1. [Clean Data], which looks for invalid data and gets it into a better state for future steps
    * Changes for incorrect data:
        * Updates all non-applicable Types2 to be empty strings rather than 'NA'
        * Updates the values for 25 Pokemon from generations 1-6 that were rebalanced with generation 7
        * Updates all instances of é to have the appropriate character (Flabébé is a Pokemon name)
        * Attempts to update instances of ♀ and ♂ to include the gender symbols, but those are not supported in SAS Studio's charset
            * At least, for the version of SAS Studio I was using
        * The results of the above changes can be found in the [`proc compare` RTF output][clean-summary]
    * Removes duplicate entries for each Pokedex number
        * This removes all Mega Evolutions and alternate forms
        * This step had to be done after `proc compare`, otherwise the change in indexes made that chart useless
1. [Analyze Data], which runs various types of analysis on the [variables](#variables)
        
## Tableau Files

Original workbook can be found at [PokemonDataAnalysis.twb] but the but experience is better with the bundled version at [PokemonDataAnalysis.twbx]

## Visualizations

Overall, there are 5 unique visualizations with 4 of them also having versions excluding legendary Pokemon.

* Max Total Stats By Type
    * [All](visualizations/MaxTotalByType.png)
    * [No Legendaries](visualizations/MaxTotalByTypeNoLegendary.png)
* [Median Total Across Generations](visualizations/MedianTotalAcrossGenerations.png)
* Pokemon Attack and Defense
    * [All](visualizations/PokemonAttackAndDefense.png)
    * [No Legendaries](visualizations/PokemonAttackAndDefenseNoLegendary.png)
* Pokemon Sp. Attack and Sp. Defense
    * [All](visualizations/PokemonSpAttackAndSpDefense.png)
    * [No Legendaries](visualizations/PokemonSpAttackAndSpDefenseNoLegendary.png)
* Pokemon Total Stats
    * [All](visualizations/PokemonTotalStats.png)
    * [No Legendaries](visualizations/PokemonTotalStatsNoLegendary.png)

A write up of the above charts can be found in [Visualizations.md]

[local-pokemon]: https://github.com/ItsASine/pokemonData
[github-pokemon]: https://github.com/lgreski/pokemonData
[kaggle-pokemon]: https://www.kaggle.com/abcsds/pokemon
[Pokemon.csv]: data/Pokemon.csv
[pokemon_clean.csv]: data/pokemon_clean.csv
[Import Data]: sas_files/1%20Import%20Data.sas
[Clean Data]: sas_files/2%20Clean%20Data.sas
[Analyze Data]: sas_files/3%20Analyze%20Data.sas
[clean-summary]: docs/Cleaning%20Summary.rtf
[PokemonDataAnalysis.twb]: tableau_files/PokemonDataAnalysis.twb
[PokemonDataAnalysis.twbx]: tableau_files/PokemonDataAnalysis.twbx
[Visualizations.md]: docs/Visualizations.md
