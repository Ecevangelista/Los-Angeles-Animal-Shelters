#####
# EDA of Los Angeles Animal Shelter data 2011-2013
#####

#Ingesting csv file

my.path <- 'C:\\Users\\Elaine\\Documents\\Northwestern MSDS\\LA City data\\'
my.file <- paste(my.path,'Animal_Services_Intake_Data.csv',sep='');
my.data <- read.csv(my.file,header=TRUE);

#Examining data

str(my.data)

summary(my.data)


mydata1 <- my.data                              # Duplicate data

#Use lubridate to extract values from Intake Date field
#Use dplyr to manipulate dataset and pivot the data
#Use ggplot to create graphs

library(lubridate)
library(dplyr)
library(ggplot2)


mydataD <- my.data    # Duplicate data

#Use lubridate to convert from character to posix date
mydataD$Date3 <- mdy(mydataD$Intake.Date) 

# Use as.Date to convert to a Date object
mydataC$Date3 <- as.Date(mydataC$Intake.Date, "%m/%d/%Y")

head(mydataD)

#Create separate columns for Month and Year values to organize the data
mydataD$Month<- month(mydataD$Date3, label = TRUE, abbr = TRUE )
mydataD$Year<-year(mydataD$Date3)


#Organize data by Shelter, Month, and Year to get monthly intake by shelter
monthly_tot_sum2 <- mydataD %>%
  group_by(Shelter, Month, Year) %>%
  summarise(monthly_total2=n())

monthly_tot_sum2      #look at new dataframe 

#use summarise to get average monthly total over the 3 years
monthly_tot_sum3 <-monthly_tot_sum2 %>%
  group_by(Shelter,  Month) %>%
  summarise(avg_month = mean(monthly_total2))


#Plot average monthly intake per shelter
ggplot(data = monthly_tot_sum3, aes(x = Month, y = avg_month, color = Shelter, 
                                    group = Shelter)) +geom_line()+
  ggtitle("Average Monthly Intake 2011-2013")



#Look at average annual counts of animals by shelter by animal type

#Organize data by shelter, year, and animal type
animal_total_yearly <- mydataD %>%
  group_by(Shelter, Year, Animal.Type) %>%
  summarise(an_yearly_total=n())

#Use summarise to get average yearly totals over the 3 years
avg_animal_shelter <- animal_total_yearly %>%
  group_by(Shelter,  Animal.Type) %>%
  summarise(avg_year = mean(an_yearly_total))

#Plot average yearly totals per shelter and animal type
ggplot(avg_animal_shelter, aes(fill=Animal.Type, y=avg_year, x=Shelter)) + 
  geom_bar(position="stack", stat="identity")+
  ggtitle("Average Yearly Counts by Animal Type")

#Get top 5 breeds of live cats and dogs

#Create dataframe with only dogs and cats marked Alive
dflive <- mydataD[mydataD$Intake.Condition == "ALIVE" & mydataD$Animal.Type %in%
                    c("DOG", "CAT"),]

head(dflive)

#Create dataframe of only live dogs
dflive_dog <- dflive[dflive$Animal.Type == "DOG",]

head(dflive_dog)

#Organize data by shelter, year, and breed
dog_shelter <- dflive_dog %>%
  group_by(Shelter, Year, Breed.1) %>%
  summarise(dog_yearly = n())

head(dog_shelter)

#Use summarise to get average yearly totals per dog breed
avg_dog_shelter <- dog_shelter %>%
  group_by(Shelter, Breed.1) %>%
  summarise(avg_year = mean(dog_yearly))

#Sort to get Top 5 breeds by shelter
dog_5<- avg_dog_shelter %>%                                      
  arrange(desc(avg_year)) %>% 
  group_by(Shelter) %>%
  slice(1:5)

print(dog_5)


#Top 5 Cat breeds per shelter

#Create dataframe of only live cats
dflive_cat <- dflive[dflive$Animal.Type == "CAT",]

#Organize data by shelter, year, and breed
cat_shelter <- dflive_cat %>%
  group_by(Shelter, Year, Breed.1) %>%
  summarise(cat_yearly = n())

#Use summarise to get average yearly totals
avg_cat_shelter <- cat_shelter %>%
  group_by(Shelter, Breed.1) %>%
  summarise(avg_year = mean(cat_yearly))

#Sort to get top 5 breeds per shelter
cat_5<- avg_cat_shelter %>%                                      
  arrange(desc(avg_year)) %>% 
  group_by(Shelter) %>%
  slice(1:5)

print(cat_5)


