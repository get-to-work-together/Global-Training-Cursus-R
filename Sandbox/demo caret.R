#install.packages("caret")
#install.packages("palmerpenguins")

library(tidyverse)
library(palmerpenguins)
library(caret)
library(rpart.plot)

#-------------------------------------------------------------------------
# Get the data
data <- as_tibble(penguins)

#-------------------------------------------------------------------------
# Exploratory Data Analysis
head(data)
str(data)

#-------------------------------------------------------------------------
# Rename columns - remove units

# data <- data %>% rename(bill_length = bill_length_mm,
#                         bill_depth = bill_depth_mm,
#                         flipper_length = flipper_length_mm,
#                         body_mass = body_mass_g)

# or with a regular expression

data <- data %>% rename_with( ~ gsub("((_mm)|(_g))", "", ., fixed = FALSE))

#-------------------------------------------------------------------------
# Only columns of interest

columns_of_interest = c(
  'species',
  'island',
  'bill_length', 
  'bill_depth',
  'flipper_length',
  'body_mass',
  'sex'
)

data <- data %>% select(columns_of_interest)

#-------------------------------------------------------------------------
# Remove missing observations

# data %>% filter(is.na(sex))
# data <- data %>% filter(!is.na(sex))

# or

data <- data %>% drop_na()

#-------------------------------------------------------------------------
# One-hot encoding

dummy_vars <- dummyVars( ~ island + sex, data = data)
dummy_columns <- predict(dummy_vars, data)

data <- data %>% bind_cols(dummy_columns)

#-------------------------------------------------------------------------
# Split in training and test dataset

set_seed(111)

# Get row numbers for the training data
trainRowNumbers <- createDataPartition(data$species, p=0.7, list=FALSE)

# Create the training  dataset
trainData <- data[trainRowNumbers,]

# Create the test dataset
testData <- data[-trainRowNumbers,]

# Store X and y for later use.
X = trainData %>% select(-c('species'))
y = trainData['species']

#-------------------------------------------------------------------------
# Scale numeric features

Scaler <- preProcess(trainData, rangeBounds = c(0,1), method = "range")
scaledTrainData = predict(Scaler, trainData)
scaledTestData = predict(Scaler, testData)

#-------------------------------------------------------------------------
# Prepare for training the model

ctrl <- trainControl(
  method = "LGOCV", 
  repeats = 3, 
  savePred = TRUE,
  verboseIter = TRUE,
  preProcOptions = list(thresh = 0.95)
)

preProcessInTrain = c()

metric_used<-"Accuracy"

formula <- species ~ 
  bill_length + 
  bill_depth +  
  flipper_length + 
  body_mass
# island.Biscoe + island.Dream + island.Torgersen  + 
# sex.female + sex.male + 

target_name = all.vars(formula)[1]
feature_names = attr(terms.formula(formula), "term.labels")

classifion_algorithms = c(
  'knn',
  'rpart',
  'naive_bayes',
  'rf',
  'lssvmRadial',
  'plr',
  'mlp'
)

#-------------------------------------------------------------------------
# k Nearest Neighbor
#-------------------------------------------------------------------------

model <- train(
  formula,
  method = 'knn',
  data = scaledTrainData,
  trControl = ctrl,
  metric=metric_used,
  tuneLength = 10,
  preProc = preProcessInTrain
  )

predicted <- predict(model, newdata = scaledTestData)

model
plot(model)

#-------------------------------------------------------------------------
# Correct predictions

correct = predicted == testData$species

testData['KNN_predicted'] = predicted
testData['KNN_correct'] = correct

accuracy = sum(correct) / length(correct)
accuracy

#-------------------------------------------------------------------------
# Confusion Matrix

cm <- table(testData$species, predicted)
cm

confusionMatrix(data = predicted, reference = testData$species, mode = "prec_recall")

#-------------------------------------------------------------------------
# Variable Importance

features <- as.matrix(trainData[feature_names])
targets <- trainData[[target_name]]

varimp <- varImp(x = features, y = targets, useModel = FALSE)
plot(varimp, main="Variable Importance")

#-------------------------------------------------------------------------
# Decision Tree
#-------------------------------------------------------------------------

model <- train(
  formula, 
  data = trainData,
  method = "rpart",
  trControl = ctrl,
  metric=metric_used,
  tuneLength = 10,
  preProc = preProcessInTrain
)

rpart.plot(model$finalModel)

predicted <- predict(model, testData, type = 'class')
correct = predicted == testData$species

testData['DT_predicted'] = predicted
testData['DT_correct'] = correct

accuracy = sum(correct) / length(correct)

cm <- table(testData$species, predicted)
cm

confusionMatrix(data = predicted, reference = testData$species, mode = "prec_recall")

#-------------------------------------------------------------------------
# Variable Importance

varimp <- varImp(model, surrogates = FALSE, competes = TRUE)
varimp
plot(varimp, main="Variable Importance")

#-------------------------------------------------------------------------
# Variable importance

varimp <- varImp(model)
plot(varimp, main="Variable Importance")

#-------------------------------------------------------------------------
# Naive Bayes
#-------------------------------------------------------------------------

model <- train(formula,
               method = 'naive_bayes',
               data = scaledTrainData)

model

predicted <- predict(model, newdata = scaledTestData)

correct = predicted == testData$species

testData['NB_predicted'] = predicted
testData['NB_correct'] = correct

accuracy = sum(correct) / length(correct)

cm <- table(testData$species, predicted)
cm

confusionMatrix(data = predicted, reference = testData$species, mode = "prec_recall")


#-------------------------------------------------------------------------
# Support Vector Machine with RBF kernel
#-------------------------------------------------------------------------

model <- train(formula,
               method = 'lssvmRadial',
               data = scaledTrainData)

model

predicted <- predict(model, newdata = scaledTestData)

correct = predicted == testData$species

testData['SVM_predicted'] = predicted
testData['SVM_correct'] = correct

accuracy = sum(correct) / length(correct)

cm <- table(testData$species, predicted)
cm

confusionMatrix(data = predicted, reference = testData$species, mode = "prec_recall")

varimp <- varImp(model)
varimp
plot(varimp, main="Variable Importance")
