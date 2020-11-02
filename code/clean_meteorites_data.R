#Load libraries
library(tidyverse)
library(janitor)
library(assertr)

#Read data and explore
meteorites <- read_csv("meteorite_landings.csv") %>%  clean_names()
head(meteorites)
names(meteorites)
dim(meteorites)

#Change names of variables to follow naming standards
meteorites <- meteorites %>% 
  mutate(name = (str_to_lower(name))) %>% 
  mutate(fall = (str_to_lower(fall)))
meteorites <- meteorites %>% 
  mutate(name = str_replace_all(name, "[:space:]", "_"))

#Splitting the column
meteorites <- meteorites %>% 
  separate(col = geo_location, into = c("latitude", "longitude")
           , sep = "\\,") 

meteorites <- meteorites %>% 
  mutate(latitude = (str_remove(latitude, "\\("))) %>% 
  mutate(longitude= (str_remove(longitude, "\\)")))

#Replace missing values with zero
meteorites <- meteorites %>% 
  mutate(latitude = coalesce(latitude, "0")) %>% 
  mutate(longitude = coalesce(longitude, "0")) 

#Remove small meteorites and order data by year
meteorites <- meteorites %>% 
  filter(mass_g > 1000) %>% 
  arrange(year)

meteorites$latitude <- as.numeric(as.character(meteorites$latitude),  length = 10)
meteorites$longitude <- as.numeric(as.character(meteorites$longitude), length = 10)

#Assertive programming
meteorites %>% 
  #verify(cols(1:6) == cols("id", "name", "mass (g)", "fall", "year", "GeoLocation")) %>% 
  verify(latitude > -90 & latitude < 90) %>% 
  verify(longitude > -180 & longitude < 180)


meteorites
