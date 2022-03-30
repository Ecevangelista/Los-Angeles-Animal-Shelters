# Exploratory Data Analysis on Los Angeles Animal Shelters  

I conducted exploratory data analysis using R on LA Animal Shelter intake data captured from January 2011 – December 2013. The data includes 187,593 records of animals taken in amongst 8 shelters around Los Angeles. This exploratory data analysis could be used to help LA Animal Services understand the volume of animals coming into the shelters to use for operational planning as well as prepare promotions for dog and cat adoptions.  

Data Source: https://data.lacity.org/Sanitation/Animal-Services-Intake-Data/8cmr-fbcu


### Data Preprocessing  
Each record included values for Shelter, Animal ID, Intake Date, Intake Type, Animal Type, and Breed 1. When looking at breeds for cats and dogs, I used the values from the Breed 1 column, since there were incomplete records for Group and Breed 2. 
Both the Annex and North East Shelters do not contain complete data across the 3 years, so their volume totals cannot be equitably compared with the other shelters.   Below is their data availability:  
* Annex:  January 2011 – June 2013 (does not include March 2013 data)  
* N East: January - July 2011  

Intake Date records were processed by extracting the month and year values using the lubridate library.

### Animal Types and Monthly Volume per Shelter
##### Average Yearly Counts by Animal Type  
The chart below displays the types of animals taken in at each shelter and the average yearly counts per shelter. E Valley has the highest annual total at over 16,000, while Harbor and W LA have similar low totals at over 5,500.  

Dogs and cats make up the majority of animals taken into the shelters, with Dogs outnumbering cats  at most shelters. The next type of animal to be taken in falls into the “Other” category, which includes a variety of animals such as squirrels, possums, and turtles. These totals can inform how to allocate resources across the shelters and within each shelter. East Valley, N Central, and West Valley buildings should accommodate space for the “Other” animal types, while Harbor and South LA should plan to handle mostly dogs and cats.   

![Avg yearly counts animal type](https://user-images.githubusercontent.com/49419673/160713190-d35aa3bd-ddcc-48ec-915e-12de765af744.jpeg)  

##### Average Monthly Intake 2011 – 2013  
In keeping with the total yearly counts, East Valley has the highest average monthly intake across all the shelters. The months with the most activity run from March – October for most shelters. While the West LA shelter sees a peak in intake in May, its average monthly volume is fairly consistent throughout the year. For staffing and resources planning, shelters 
should plan to increase staff and materials used during the months with high activity.   

![avg monthly intake](https://user-images.githubusercontent.com/49419673/160713486-510ad49c-55bb-4985-8e69-8d437f8119db.jpeg)  

### What breeds are available at the shelters?  
The top 5 breeds of dogs and cats were tallied using average yearly totals of the live animals taken into each shelter. Since Annex and N East did not have full data, these shelters are not included below. These lists can help the shelters plan promotions for animal adoption. 

#### Dogs
Pit bulls, Chihuahua, Terrier mixes, German Shepherd are the most common breeds available across the shelters. Labrador Retrievers also made the top 5 breeds in 4 of the shelters.  

| East Valley        | Harbor             | N Central                      |
| ------------------ | ------------------ | ------------------------------ |
| Chihuahua          | Pit Bull           | Chihuahua                      |
| Terrier Mix        | Chihuahua          | Pit Bull                       |
| German Shepherd    | German Shepherd    | Terrier Mix                    |  
| Pit Bull           | Terrier Mix        | German Shepherd                |
| Labrador Retriever | Labrador Retriever | American Staffordshire Terrier |

 | S LA                           | West LA            | West Valley                    |
 | ------------------------------ | ------------------ | ------------------------------ | 
 | Chihuahua                      | Chihuahua          | Chihuahua                      |
 | Pit Bull                       | Terrier Mix        | German Shepherd                |
 | Terrier Mix                    | German Shepherd    | American Staffordshire Terrier |
 | German Shepherd                | Labrador Retriever | Labrador Retriever             |
 | American Staffordshire Terrier | Poodle (Miniature) | Terrier Mix                    |
 
 #### Cats  
 Domestic Short Hairs, Medium Hairs, Long Hairs, and Siamese cats are among the top 5 breeds at all 6 shelters. 
 
| East Valley           | Harbor               | N Central            |
| --------------------- | -------------------- | -------------------- |
| Domestic Short Hair   | Domestic Short Hair  | Domestic Short Hair  |
| Domestic Medium Hair  | Domestic Medium Hair | Domestic Medium Hair |
| Domestic Long Hair    | Domestic Long Hair   | Domestic Long Hair   |  
| American Short Hair   | Siamese              | Siamese              |
| Siamese               | Russian Blue         | American Short Hair  |

| South LA              | West LA              | West Valley          |
| --------------------- | -------------------- | -------------------- |
| Domestic Short Hair   | Domestic Short Hair  | Domestic Short Hair  |
| Domestic Medium Hair  | Domestic Medium Hair | Domestic Medium Hair |
| Domestic Long Hair    | Domestic Long Hair   | Domestic Long Hair   |  
| Siamese               | Siamese              | Siamese              |
| American Short Hair   | American Short Hair  | Russian Blue         |
 
