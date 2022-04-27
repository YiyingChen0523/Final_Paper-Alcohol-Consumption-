#Clean and prepare the data for later analysis

#Convert the numerical value back to categorical value, mutate a new useful variable, also removing all empty lines which will be not used for future analysis


alcohol_clean <- Alcohol_consumption %>%
select(V07_PROVINCE, V08_SEX, V16_NUMPEOPLE, V17_PEOPLE18, V29_RESPEDUC, V30_RESPAGE, V36_TENURE, V43_SOCCLASS, V64_DRINK, V65_DRINK1, V68_DRINK8, V70_DRINKPROB) %>%
  mutate(sex = case_when(V08_SEX == "1" ~ "Male",
                         V08_SEX == "2" ~ "Female",
                         TRUE           ~ "other")) %>%
  mutate(province = case_when(V07_PROVINCE == "0" ~ "British Columbia",
                              V07_PROVINCE == "1" ~ "Newfoundland",
                              V07_PROVINCE == "2" ~ "Prince Edward Island",
                              V07_PROVINCE == "3" ~ "Nova Scotia",
                              V07_PROVINCE == "4" ~ "New Brunswick",
                              V07_PROVINCE == "5" ~ "Quebec",
                              V07_PROVINCE == "6" ~ "Ontario",
                              V07_PROVINCE == "7" ~ "Manitoba",
                              V07_PROVINCE == "8" ~ "Saskatchewan",
                              V07_PROVINCE == "9" ~ "Alberta",
                              TRUE           ~ "other")) %>%
  mutate(tenure = case_when(V36_TENURE == "1" ~ "own",
                            V36_TENURE == "2" ~ "rent",
                            TRUE           ~ "other")) %>%
  mutate(drinking_problem = case_when(V70_DRINKPROB == "1" ~ "yes",
                                      V70_DRINKPROB == "2" ~ "no",
                                      TRUE           ~ "other")) %>%
  mutate(alcoholic_beverages = case_when(V64_DRINK == "1" ~ "yes",
                                         V64_DRINK == "2" ~ "no",
                                         TRUE           ~ "other")) %>%
  mutate(people_under_18 = V16_NUMPEOPLE - V17_PEOPLE18) %>%
  filter(V65_DRINK1 !="8" & V65_DRINK1 !="9") %>%
  filter(!is.na(V65_DRINK1) & !is.na(V08_SEX) & !is.na(V07_PROVINCE))