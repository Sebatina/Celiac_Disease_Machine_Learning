install.packages("caret")
# Load the necessary libraries
library(caret)

# Read your data into a dataframe 
data <- read.csv("data.csv")

# Set the column index of the class labels in your data 
class_col <- 1

# Split the data into features and class labels
features <- data[, -class_col]
labels <- data[, class_col]

# Set the seed for reproducibility
set.seed(123)

# Split the data into training, test, and validation sets
train_indices <- createDataPartition(labels, times = 1, p = 0.6, list = FALSE)
remaining_data <- data[-train_indices, ]
test_indices <- createDataPartition(remaining_data$label, times = 1, p = 0.5, list = FALSE)

train_data <- data[train_indices, ]
test_data <- remaining_data[-test_indices, ]
validation_data <- remaining_data[test_indices, ]

# Set up the training control with default parameters
ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

# Perform Ensemble Feature Selection using default parameters on the training data
efs_model <- rfe(train_data[, -class_col], train_data[, class_col], sizes = c(1:length(features)), method = "rf", trControl = ctrl)

# Print the selected features
print(efs_model$optVariables)
