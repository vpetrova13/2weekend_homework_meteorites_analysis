## Overview of the project

Data was taken from [open source NASA](https://www.kaggle.com/nasa/meteorite-landings) about meteorites that have been found up to 2013. The project can be split up into 2 sections: data cleaning up and analysis.
The analysis of data was performed using R. 

##  Data cleanning or preparation prior to analysis

Script for data cleaning can be found [**here**](code/clean_meteorites_data.R).

	clean_meteorites_data.R
	

* Required libraries were loaded and data was briefly explored.
* Column names were changed following naming standards - "snake_case".
* GeoLocation column was split into latitude and longitude.
* Missing data of location was replaced with zeros.
* Small meteorites (less than 1000 g) were removed.
* The data was ordered by year of discovery. 
* Latitude and longitude columns were transferred to numeric class.
* Finally, assertive programming was set up for latitude and longitude columns.


## Meteorites data analysis

Script for data analysis can be found [**here**](code/meteorites_data_analysis.Rmd).
	
	meteorites_data_analysis.Rmd

* Mostly using dplyr from tidyverse, the data was analysed.
* The names of 10 largest meteorites were found by year.
* Average mass of meteorites split up by their "fall" - found or fell.
* Total number of meteorites per year since 2000. 
* Biggest meteorite found per year. 
* Biggest meteorite fell per year.
* The 10 biggest meteorites over all the years.
* The 10 smallest meteorites over all the years.
* Median latitude and longitutde of all meteorites. 
* Mass of meteorites changed from grams to kilograms. 

## Packages
| Package | Version |
| --------|---------|
|tidyverse|1.3.0|
|janitor|2.0.1|
|assertr|2.7|
|scales|1.1.1|
|ggplot2|3.3.2|
|maps|3.3.0|
