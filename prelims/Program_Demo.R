# Initialize a list where student data will be contained within vectors.
# Vectors shall contain the following: ID Num, Name, and Status
student_list <- list(c(2223175, "Rohit Tank", "Present"))

# The edit_student_attendance allows for the modification of a student's attendance remark
# based on their assigned student ID. It iterates through the student list and updates the
# attendance remark for the matching ID. If the student is found, the
# attendance remark is updated, and the modified list is returned. If the
# student is not found, the function prints an error message and returns the
# unchanged list.
edit_student_attendance <- function(id, new_status) {
  for (i in 1:length(student_list)) {
    student <- student_list[[i]]
    if (student[1] == id) {
      student[3] <- new_status
      student_list[[i]] <- student
      cat("Attendance updated successfully.")
      return(student_list)
    }
  }
}


# Function to add a student to the student_list list data structure.
# The function accepts an id number and student name and creates a vector
# using the provided student details. This vector is then added to the
# student_list list.
add_student <- function(id, student_name) {
  student <- c(id, student_name, "Present")
  student_list[[length(student_list) + 1]] <- student
  cat("Student added successfully.")
  return(student_list)
}

# Function to display student attendance with its corresponding
# ID number, Name, and remark. This includes the current date
# of the current day. The function takes the data of the
# 'student_list' vector and then converts it to a data frame
# and then finally formats and displays it in a tabular format
display_attend <- function() {
  #Data of Added Students
  student_data <- data.frame(
    ID_Num = sapply(student_list, "[[", 1),
    Name = sapply(student_list, "[[", 2),
    Status = sapply(student_list, "[[", 3)
  )

  # Get the number of rows in data of student
  num_students <- nrow(student_data)

  # Concatenate the Class Attendance and Current Date Function
  heading <- paste("<-------- CLASS ATTENDANCE-", Sys.Date(),"-------->\n")

  # Display heading
  cat(heading)

  # Define the headers
  header <- c("ID_Num", "Name", "Status")

  # Create and Display the Formatted Header
  formatted_header <- sprintf("%-10s\t%-20s\t%-1s\n", header[1], header[2], header[3])
  cat(formatted_header)
  cat("\n")

  # Display the Formatted Student's Attendance Data with for loop
  for (i in 1:num_students) {
    formatted_rows <- sprintf("%-10s\t%-20s\t%-1s\n",
                              student_data$ID_Num[i],
                              student_data$Name[i],
                              student_data$Status[i])
    cat(formatted_rows)
  }
}

# While loop where options for the program are displayed and functions
# of the program are invoked depending on the user's chosen option.
while (TRUE) {

  cat("Attendance Monitoring System\n")
  cat("1. Add a Student\n")
  cat("2. Edit Student Attendance\n") 
  cat("3. Display Student Attendance\n")
  cat("4. Exit\n")

  choice <- as.integer(readline("Choose the option that corresponds to your choice: "))

  # Add a Student Option
  if (choice == 1) {

    #Validate Entered ID Number
    while(TRUE){
      id <- readline("Enter student ID: ")


      if (is.na(as.integer(id))) {
        cat("ID must be numeric!")
      } else {
        id <- as.integer(id)  # Convert id to an integer
        does_exist <- FALSE
        for (i in 1:length(student_list)) {
          student <- student_list[[i]]
          if (student[1] == id) {
            does_exist <- TRUE
            break
          }
        }

        if (!does_exist) {
          break
        } else {
          cat("Student ID already exists!")
        }
      }
    }

    name <- readline("Enter student name: ")
    student_list <- add_student(id, name)

  } else if (choice == 2) {
    # Edit Student Attendance choice prompts the student's ID and the appropriate status
    while (TRUE) {
      id <- readline("Enter student ID to edit attendance: ")

      id <- as.integer(id)  # Convert id to an integer
      does_exist <- FALSE
      for (i in 1:length(student_list)) {
          student <- student_list[[i]]
          if (student[1] == id) {
            does_exist <- TRUE
            break
          }
        }

      if (!does_exist) {
        cat("Student ID already exists!")
      }
      else{
        break
      }
    }

    # Prompt for new attendance status and validate it
    while (TRUE) {
      new_status <- readline("Enter new attendance status (Absent, Tardy, Present): ")
      if (new_status %in% c("Absent", "Tardy", "Present")) {
        break  # Input is valid, exits the loop
      } else {
        cat("Invalid input. Please enter one of: Absent, Tardy, Present.\n")
      }
    }

    student_list <- edit_student_attendance(id, new_status)

  } else if (choice == 3) {
    display_attend()

    # Exit Program
  } else if (choice == 4) {
    cat("Program Exited")
    break

    # Display Error message when opt
  } else {
    cat("Invalid Choice! Make sure to choose an option from those provided.")
  }
} # End of While Loop