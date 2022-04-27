#Get Original Data
library(readxl)
library(tidyverse)
library(janitor)
library(tinytex)

#Access the csv file "Alcohol_Consumption_in_Canada" from the input folder and download it on the desktop
Alcohol_consumption <- read_csv("/Users/chenyiying/Desktop/Alcohol_Consumption_in_Canada.csv")