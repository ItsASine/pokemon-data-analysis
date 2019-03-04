## Max Total By Type
![](visualizations/MaxTotalByType.png)
![](visualizations/MaxTotalByTypeNoLegendary.png)

The chart denotes maximum values of the Total Stats variable and how it relates to the primary and secondary types of Pokemon. This is an exploration to see if any Pokemon type or type combination is inherently more powerful than the others.     
Observations:
* Legendaries seem to have a nontrivial amount of unique type combinations judging by the removed data between with and without legendaries.
* Legendaries have a maximum max total at 720. though that is a Normal only type. Otherwise, legendary Pokemon have total stats up to 680 and non-legendaries seem to max out at 600.
* Dragon and Psychic Pokemon appear to have the most total stats.

## Median Total Across Generations
![](visualizations/MedianTotalAcrossGenerations.png)

The chart shows the median values of Total Stats for Pokemon grouped by their Generation value. This exploration was meant to look into the possibility of power creep across generations.     
Observations:
* Generation 1 had the lowest median while generation 7 had the highest, supporting the initial hypothesis of scope creep
* Generation 4 is a significant outlier due to its location between generation 7 and the bunched up generations 1, 2, 3, 5, and 6.

## Pokemon Attack And Defense
![](visualizations/PokemonAttackAndDefense.png)
![](visualizations/PokemonAttackAndDefenseNoLegendary.png)

This chart shows the relationship between Attack and Defense for each individual Pokemon. Data points are labelled by their names and primary type.
Observations:
* The upper right quadrant appears to be the optimal one to select well rounded but strong Pokemon from.
* Looking purely at Total Stats might not give the best picture for how well a Pokemon will fare in battle.

## Pokemon Sp. Attack And Sp. Defense
![](visualizations/PokemonSpAttackAndSpDefense.png)
![](visualizations/PokemonSpAttackAndSpDefenseNoLegendary.png)

This chart shows the relationship between Special Attack and Special Defense for each individual Pokemon. Data points are labelled by their names and primary type.
Observations:
* The upper right quadrant Pokemon between Attack/Defense and SpAttack/SpDefense appear to not overlap.
* A well balanced Pokemon team would be comprised of Pokemon from both charts' upper right quadrants.

## Pokemon Total Stats
![](visualizations/PokemonTotalStats.png)
![](visualizations/PokemonTotalStatsNoLegendary.png)

This chart is a treemap of all Pokemon by Total Stats and labelled by name. This will allow for quick identification of the specific data points with a large amount of stats overall.
Observations:
* Arceus was the Pokemon with a total of 720. Due to his Normal typing, though, it's unlikely that he is competitively viable, especially considering the findings of the Attack/Defense and SpAttack/SpDefense charts.
* Slaking is the largest non-legendary Pokemon and also a Normal type. It appears that this is due to a high Attack and HP value.

