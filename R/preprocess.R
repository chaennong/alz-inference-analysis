preprocess <- function(data) {
  library(dplyr)
  data <- data %>% dplyr::select(-c(PatientID, DoctorInCharge))
  data$Gender <- as.factor(data$Gender)
  data$Ethnicity <- as.factor(data$Ethnicity)
  data$EducationLevel <- as.factor(data$EducationLevel)
  data$Smoking <- as.factor(data$Smoking)
  data$FamilyHistoryAlzheimers <- as.factor(data$FamilyHistoryAlzheimers)
  data$CardiovascularDisease <- as.factor(data$CardiovascularDisease)
  data$Diabetes <- as.factor(data$Diabetes)
  data$Depression <- as.factor(data$Depression)
  data$HeadInjury <- as.factor(data$HeadInjury)
  data$Hypertension <- as.factor(data$Hypertension)
  data$MemoryComplaints <- as.factor(data$MemoryComplaints)
  data$BehavioralProblems <- as.factor(data$BehavioralProblems)
  data$Confusion <- as.factor(data$Confusion)
  data$Disorientation <- as.factor(data$Disorientation)
  data$PersonalityChanges <- as.factor(data$PersonalityChanges)
  data$DifficultyCompletingTasks <- as.factor(data$DifficultyCompletingTasks)
  data$Forgetfulness <- as.factor(data$Forgetfulness)
  data$Diagnosis <- as.factor(data$Diagnosis)
  
  data$HDLlevel <- data$CholesterolHDL
  data$HDLlevel <- with(data, ifelse(
    HDLlevel > 80, "High",
    ifelse(
      (Gender == 0 & HDLlevel >= 50) | (Gender == 1 & HDLlevel >= 40), "Optimal",
      "Low"
    )
  )
  )
  data
}

split_hdl <- function(data) {
  high <- data[data$HDLlevel == "High",]
  optimal <- data[data$HDLlevel == "Optimal",]
  low <- data[data$HDLlevel == "Low",]
  
  list(
    high = high,
    optimal = optimal,
    low = low
  )
}