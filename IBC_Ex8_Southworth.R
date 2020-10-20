# Intro to Biocomputing Exercise 8
# Chelsea Southworth

# Question 1: Basketball cumulative score plot

# load the text file into R
UWvsMSU <- read.table("https://raw.githubusercontent.com/chelsea307/Biocomputing2020_Exercise08/main/UWvMSU_1-22-13.txt",
                      header = TRUE)

# create a new dataframe with the column "new" which has the cumulative total score, grouped by "team" column
UWvsMSUcum <- transform(UWvsMSU, new=ave(score,team,FUN=cumsum))

# plot "time" on x axis, "new" or cumulative score on y axis
# color points by team
# give the plot a title
# change the x and y axis labels to "time" and "cumulative score"
plot(UWvsMSUcum$time,UWvsMSUcum$new,
     col=UWvsMSUcum$team,
     main="UW vs MSU 1/22/13",
     xlab="time",ylab="cumulative score")
# add a legend so you know which team is represented by each color
legend(5, 45, legend=c("UW", "MSU"),
       col=c("red", "black"), lty=1:1, cex=0.8)



# Question 2: Guess my number game

# create a function that will allow user input
readinteger <- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  return(as.integer(n))
}

# randomly sample a number between 1 and 100
x <- 1:100
num <- sample(x)
guess <- -1

# print the "I'm thinking of a number 1-100..." prompt
cat("I'm thinking of a number 1-100...\n")

# if the user input is equal to the randomly selected number, print "Correct!"
# if the user input is less than the randomly selected number, print "Higher"
# if the user input is greater than the randomly selected number, print "Correct!"
for(i in 1:10){
while(guess != num)
{ 
  guess <- readinteger()
  if (guess == num)
  {
    cat("Correct!\n")
  }
  else if (guess < num)
  {
    cat("Higher\n")
  }
  else if(guess > num)
  {
    cat("Lower\n")
  }
}}
