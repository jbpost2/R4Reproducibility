#############################################################
## R code from the slides
#############################################################

#simple math operations
# <-- is a comment - code not evaluated
3 + 7
10 * exp(3) #exp is exponential function
log(pi^2) #log is natural log by default


mean(cars$speed)
hist(cars$speed)


#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings (text) can be saved as well
words <- c("Hello there!", "How are you?")
words


letters
head(cars, n = 3)

vec <- c(1, 4, 10)
vec

fit <- lm(dist ~ speed, data = cars)
fit

str(cars)
str(vec)


#vectors (1 dimensional) objects
x <- c(17, 22, 1, 3, -3)
y <- c("cat", "dog", "bird", "frog")
x
y


v <- seq(from = 1, to = 5, length = 5)
#same result with different inputs:
v <- seq(from = 1, to = 5, by = 1)
v
str(v)


1:20 
1:20/20
1:20 + 1


letters #built-in vector
letters[1] #R starts counting at 1!
letters[26]

letters[1:4]
letters[c(5, 10, 15, 20, 25)]
x <- c(1, 2, 5)
letters[x]

letters[-(1:4)]
x <- c(1, 2, 5)
letters[-x]


x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
myDF <- data.frame(x, y, z)
myDF


myDF <- data.frame(char = x, data1 = y, data2 = z)
myDF


myDF[c(2, 4), ]
myDF[, 1]
myDF[2, ]
myDF[2, 1]
myDF[ , c("char", "data1")]
myDF$char
myDF$data1


library("dplyr")
ls("package:dplyr")

#stats::filter(...) calls time-series function from stats package
dplyr::filter(iris, Species == "virginica")
getwd()
## setwd("C:/Users/jbpost2/repos/R4Reproducibility/slides/data")
## #or
## setwd("C:\\Users\\jbpost2\\repos\\R4Reproducibility\\slides\\data")


neuralgiaData <- read_csv("data/neuralgia.csv")
neuralgiaData
neuralgiaData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")
neuralgiaData
class(neuralgiaData)
str(neuralgiaData)

neuralgiaData[ ,1]
neuralgiaData2 <- as.data.frame(neuralgiaData)
neuralgiaData2[ ,1]

pull(neuralgiaData, Treatment) #or pull(neuralgiaData, 1)
neuralgiaData$Treatment 


read_table("https://www4.stat.ncsu.edu/~online/datasets/chemical.txt")
read_tsv("https://www4.stat.ncsu.edu/~online/datasets/crabs.txt")
read_delim("https://www4.stat.ncsu.edu/~online/datasets/umps2012.txt", 
           delim = ">",
           col_names = c("Year", "Month", "Day", "Home", "Away", "HPUmpire"))


#install package if necessary
library(readxl)
#reads first sheet by default
edData <- read_excel("censusEd.xlsx")
edData
excel_sheets("data/censusEd.xlsx")
read_excel("data/censusEd.xlsx", sheet = "EDU01D")


#install if necessary
library(haven)
smokeData <- read_sas("https://www4.stat.ncsu.edu/~online/datasets/smoke2003.sas7bdat")
smokeData


con <- DBI::dbConnect(
   RMySQL::MySQL(),
   host = "hostname.website",
   user = "username",
   password = rstudioapi::askForPassword("DB password")
)

tbl(con, "name_of_table")


library(DBI)
con <- dbConnect(
  RSQLite::SQLite(),
  "data/chinook.db"
)
dbListTables(con)

dbGetQuery(con, "SELECT * FROM invoices") %>% 
  collect() %>% 
  as_tibble()



#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations
myBatting <- as_tibble(Batting)
myBatting


"hi" == " hi" #== is comparison
"hi" == "hi"
4 >= 1
4 != 1
sqrt(3)^2  == 3
dplyr::near(sqrt(3)^2, 3)
#use of is. functions
is.numeric("Word")
is.numeric(10)
is.character("10")
is.na(c(1:2, NA, 3))
is.matrix(c("hello", "world"))


myBatting$G > 20 #vector indicating Games > 20
filter(myBatting, G > 20)
(myBatting$G > 20) & (myBatting$yearID == 2015)
filter(myBatting, (G > 20) & (yearID == 2015))
filter(myBatting, teamID %in% c("ATL", "PIT", "WSH"))
arrange(myBatting, teamID)
arrange(myBatting, teamID, G)
arrange(myBatting, teamID, desc(G))



pull(Batting, X2B)
select(myBatting, X2B)
select(myBatting, playerID, X2B)
arrange(select(filter(myBatting, teamID == "PIT"), playerID, G, X2B), desc(X2B))
myBatting %>% 
  filter(teamID == "PIT") %>% 
  select(playerID, G, X2B) %>% 
  arrange(desc(X2B)) 
#all columns between
myBatting %>% 
  select(X2B:HR)
myBatting %>% 
  select(contains("X"))
myBatting %>% 
  select(starts_with("X"))
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G)
myBatting %>% 
  select(playerID, HR, everything())
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)


library(fivethirtyeight)
fandango
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% 
  select(film, year, avgRotten, everything())
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
         avgMeta = (metacritic_norm + metacritic_user_nom)/2) %>%
  select(film, year, avgRotten, avgMeta, everything())
fandango %>% 
  select(rottentomatoes) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))
fandango %>% 
  select(year, rottentomatoes) %>% 
  group_by(year) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))
fandango %>% 
  select(year, rottentomatoes, metacritic) %>% 
  group_by(year) %>% 
  mutate(across(c(rottentomatoes, metacritic), list(avg = mean, SD = sd)))
fandango %>% 
  select(year, ends_with("user")) %>%
  group_by(year) %>% 
  mutate(across(ends_with("user"), list(trim_mean = mean), trim = 0.2))


myAirquality <- as_tibble(airquality)
myAirquality

if_else(myAirquality$Wind >= 15, "HighWind",
        if_else(myAirquality$Wind >= 10, "Windy",
                if_else(myAirquality$Wind >= 6, "LightWind", "Calm")))

myAirquality <- myAirquality %>% 
                mutate(Status = if_else(Wind >= 15, "HighWind",
                                        if_else(Wind >= 10, "Windy",
                                                if_else(Wind >= 6, "LightWind", "Calm"))))
myAirquality


tempsData <- read_table(file = "data/cityTemps.txt")
tempsData
tempsData %>% pivot_longer(cols = 2:8, names_to = "day", values_to = "temp")

newTempsData <- tempsData %>% 
  pivot_longer(cols = sun:sat, names_to = "day", values_to = "temp")
newTempsData

newTempsData %>% 
  pivot_wider(names_from = "day", values_from = "temp")


titanicData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/titanic.csv")
titanicData

titanicData %>%
  group_by(embarked) %>%
  summarize(counts = n())

titanicData %>%
  group_by(survived) %>%
  summarize(counts = n())

titanicData %>%
  group_by(embarked, survived) %>%
  summarize(counts = n())

titanicData %>%
  group_by(embarked, survived) %>%
  summarize(counts = n())

titanicData %>%
  group_by(embarked, survived) %>%
  summarize(counts = n()) %>%
  pivot_wider(values_from = counts, names_from = embarked)

titanicData %>% 
  drop_na(embarked, survived) %>%
  group_by(embarked, survived) %>%
  summarize(counts = n())

titanicData %>%
  drop_na(embarked, survived) %>%
  group_by(embarked, survived) %>%
  summarize(counts = n()) %>%
  pivot_wider(values_from = counts, names_from = embarked)


mean(titanicData$fare, na.rm = TRUE)
median(titanicData$fare, na.rm = TRUE)

titanicData %>% 
  summarize(fareMean = mean(fare, na.rm = TRUE), 
            fareMedian = median(fare, na.rm = TRUE))

mean(titanicData$age, na.rm = TRUE)
median(titanicData$age, na.rm = TRUE)

titanicData %>% 
  summarize(ageMean = mean(age, na.rm = TRUE), 
            ageMedian = median(age, na.rm = TRUE))

titanicData %>% 
  summarize(fareMean = mean(fare, na.rm = TRUE), 
            fareMedian = median(fare, na.rm = TRUE),
            fareSD = sd(fare, na.rm = TRUE),
            fareIQR = IQR(fare, na.rm = TRUE),
            fareQ1 = quantile(fare, probs = c(0.25), na.rm = TRUE))

titanicData %>% 
  summarize(fareQuantiles = quantile(fare, probs = c(0.1, 0.25, 0.5, 0.75, 0.9), na.rm = TRUE),
            q = c(0.1, 0.25, 0.5, 0.75, 0.9))

titanicData %>% 
  summarize(covar = cov(fare, age, use = "complete.obs"),
            corr = cor(fare, age, use = "complete.obs"))

titanicData %>% 
  group_by(survived) %>% 
	summarise(avg = mean(fare, na.rm = TRUE), 
	          med = median(fare, na.rm = TRUE), 
	          var = var(fare, na.rm = TRUE))

titanicData %>% 
  drop_na(survived) %>%
  group_by(survived) %>% 
	summarise(avg = mean(fare, na.rm = TRUE), 
	          med = median(fare, na.rm = TRUE), 
	          var = var(fare, na.rm = TRUE))

titanicData %>% 
  drop_na(survived, embarked) %>%
  group_by(survived, embarked) %>% 
	summarise(avg = mean(fare, na.rm = TRUE), 
	          med = median(fare, na.rm = TRUE), 
	          var = var(fare, na.rm = TRUE))

titanicData %>% 
  drop_na(survived) %>%
  group_by(survived) %>% 
	summarise(across(.fns = mean, .cols = c(age, fare), na.rm = TRUE))

titanicData %>% 
  drop_na(survived) %>%
  group_by(survived) %>% 
	summarise(across(.fns = mean, .cols = where(is.double), na.rm = TRUE))


ggplot(data = titanicData, aes(x = survived))

ggplot(data = titanicData, aes(x = survived)) + geom_bar()

g <- ggplot(data = titanicData, aes(x = survived))
g + geom_bar()

titanicData <- titanicData %>% mutate(mySurvived = as.factor(survived))
str(titanicData$mySurvived)
levels(titanicData$mySurvived) 

levels(titanicData$mySurvived) <- c("Died", "Survived")
levels(titanicData$mySurvived)

titanicData <- titanicData %>% mutate(myEmbarked = as.factor(embarked))
levels(titanicData$myEmbarked) <- c("Cherbourg", "Queenstown", "Southampton")

titanicData <- titanicData %>% drop_na(mySurvived, sex, myEmbarked)

g <- ggplot(data = titanicData, aes(x = mySurvived))
g + geom_bar()

g <- ggplot(data = titanicData, aes(x = mySurvived, fill = myEmbarked))
g + geom_bar()

#global
ggplot(data = titanicData, aes(x = mySurvived, fill = myEmbarked)) + geom_bar()

#some local, some global
ggplot(data = titanicData, aes(fill = myEmbarked)) + geom_bar(aes(x = mySurvived))

#all local
ggplot() + geom_bar(data = titanicData, aes(x = mySurvived, fill = myEmbarked))


g <- ggplot(titanicData) 
g + geom_bar(aes(x = mySurvived, fill = myEmbarked)) + 
  labs(x = "Survival Status", title = "Bar Plot of Survival and Embarked for Titanic Passengers", 
       fill = "Embarked")

g <- ggplot(titanicData) 
g + geom_bar(aes(x = mySurvived, fill = myEmbarked)) + 
  labs(x = "Survival Status", title = "Bar Plot of Survival and Embarked for Titanic Passengers", 
       fill = "Embarked") +
  coord_flip()

g <- ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) 
g + geom_bar(position = "dodge")

g <- ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) 
g + geom_bar(position = "fill")

g <- ggplot(titanicData, aes(x = age))
g + geom_density()

g <- ggplot(titanicData, aes(x = age))
g + geom_density(adjust = 0.5, alpha = 0.5, aes(fill = mySurvived))

g <- ggplot(titanicData, aes(x = age))
g + geom_density(adjust = 0.5, alpha = 0.5, position = "stack", aes(fill = mySurvived))

g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_boxplot(fill = "grey")

g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_boxplot(fill = "grey") +
    geom_jitter(width = 0.1, alpha = 0.3)

g <- ggplot(titanicData, aes(x = mySurvived, y = age)) 
g + geom_jitter(width = 0.1, alpha = 0.3) + 
    geom_boxplot(fill = "grey")

g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_violin(fill = "grey") 

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point()

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point() +  
    geom_smooth(method = lm) 

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_text(aes(label = survived, color = mySurvived))

g <- ggplot(data = titanicData, aes(x = mySurvived, fill = sex))
g + geom_bar(position = "dodge")

g <- ggplot(data = titanicData, aes(x = mySurvived, fill = sex))
g + geom_bar(position = "dodge") +
    facet_wrap(~ myEmbarked)

g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_boxplot(fill = "grey") +
    geom_jitter(width = 0.1, alpha = 0.3) + 
    facet_wrap(~ myEmbarked)

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point(aes(color = sex), size = 2.5) +
    facet_wrap(~ myEmbarked)

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point(aes(color = sex), size = 2.5) +
    facet_wrap(~ myEmbarked) +
    theme_light()

g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point(aes(color = sex), size = 2.5) +
    facet_wrap(~ myEmbarked) +
    theme_dark()


library(GGally) #install if needed
ggpairs(titanicData, aes(colour = sex, alpha = 0.4), columns = c("age", "fare", "mySurvived"))


#install each if needed
library(gapminder)
library(gganimate)
library(gifski)

gif <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
           geom_point(alpha = 0.7, show.legend = FALSE) +
           scale_colour_manual(values = country_colors) +
           scale_size(range = c(2, 12)) +
           scale_x_log10() +
           facet_wrap(~continent) +
           # Here comes the gganimate specific bits
           labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
           transition_time(year) +
           ease_aes('linear')
anim_save(filename = "img/myGif.gif", animation = gif, renderer = gifski_renderer())


