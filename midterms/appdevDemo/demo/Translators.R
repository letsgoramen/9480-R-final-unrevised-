# Create a students dataset
students <- data.frame(
  Name = c("Rohit", "Shanthal", "Melody", "Ethan", "Christian"),
  Age = c(21, 24, 21, 20, 21),
  Grade = c(98, 90, 78, 95, 88)
)

# Display the dataset
print(students)
View(students)

# import ggplot2 package
library(ggplot2)

# Create a bar plot of average grades by student
ggplot(students, aes(x = Name, y = Grade, fill = Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Grades of Students",
       x = "Student Name",
       y = "Grade") +
  theme_classic()
