# Data Science Course

Welcome to the Data Science Course repository. This repository contains exercises and projects related to data processing, statistical modeling, and K-Nearest Neighbors (KNN) analysis. The exercises focus on real-world datasets, providing hands-on experience in data science techniques using R.

## Directory Structure

### Exercises

The `Exercises` directory is organized into subdirectories, each containing a specific exercise with associated R scripts, datasets, and visualizations.

#### Exercise 1

This exercise involves data processing and exploratory data analysis on Manhattan real estate sales data.

- **Sub-directory: pics**
  - **Sub-directory: plots**:
    - **plot1.png**: Initial histogram of all sale prices.
    - **plot2.png**: Histogram of sale prices greater than zero.
    - **plot3.png**: Histogram of gross square footage for properties with zero sale price.
    - **plot4.png**: Scatter plot of gross square footage vs. sale price for properties with valid sale prices.
  - **sale_price.png**: Scatter plot of gross square footage vs. sale price.
  - **sale_price2.png**: Log-transformed scatter plot of gross square footage vs. sale price.
  - **sale_price3.png**: Refined plot after outlier removal, showing the relationship between gross square footage and sale price.

- **DataProcessing.R**: The main R script for this exercise, responsible for:
  - **Data Loading**: Reads the `rollingsales_manhattan.xls` dataset.
  - **Data Cleaning**: Processes and cleans the dataset for analysis.
  - **Exploratory Data Analysis (EDA)**: Generates summary statistics and visualizations to explore the dataset.

- **README.md**: Documentation specific to Exercise 1, providing an overview of the tasks, scripts, and generated visualizations.

- **rollingsales_manhattan.xls**: The dataset containing real estate sales records for Manhattan, used as input for the analysis in this exercise.

#### Exercise 2

This exercise focuses on advanced statistical modeling and K-Nearest Neighbors (KNN) analysis of the Manhattan real estate sales data.

- **Sub-directory: image**
  - **model1_abline.png**: Plot illustrating the best-fit line (abline) for Model 1, showing the relationship between the predictor and response variables.
  - **model1_resid.png**: Residual plot for Model 1, used to diagnose the fit of the model and check for patterns in the residuals.
  - **model2_resid.png**: Residual plot for Model 2, providing insights into the model's performance.
  - **model2a_resid.png**: A variant of the residual plot for Model 2.
  - **model3_resid.png**: Residual plot for Model 3, assessing the accuracy and reliability of the model.
  - **model4_resid.png**: Residual plot for Model 4, offering a final assessment of the model's performance.

- **Sub-directory: KNN**
  - **addrListLookup_Func.R**: Contains a custom function or set of functions for address lookup in the KNN model.
  - **KNN_Analysis.R**: Implements the K-Nearest Neighbors analysis using the cleaned dataset and custom functions.

- **Data_Cleaning_and_EDA.R**: An R script focused on:
  - **Data Cleaning**: Converts relevant fields to appropriate formats and handles missing values.
  - **Exploratory Data Analysis (EDA)**: Performs initial exploration and visualization of the data.

- **Statistical_Modeling.R**: This script is dedicated to:
  - **Outlier Detection**: Identifies and removes outliers to refine the dataset.
  - **Model Building**: Constructs and evaluates statistical models to analyze relationships between variables.

- **README.md**: Documentation specific to Exercise 2, outlining the steps, scripts, and visualizations used in this exercise.

- **rollingsales_manhattan.xls**: The dataset containing real estate sales records for Manhattan, used as input for the analysis in this exercise.

## How to Use

### Exercise 1

1. **DataProcessing.R**:
   - Run this script to load, clean, and explore the real estate sales dataset.
   - The script generates several plots that are saved in the `pics/plots` directory.

2. **Review Visualizations**:
   - Examine the plots in the `pics/plots` directory to understand the data distribution and relationships.

### Exercise 2

1. **Data_Cleaning_and_EDA.R**:
   - Execute this script to clean the data and perform initial exploratory analysis.

2. **Statistical_Modeling.R**:
   - Run this script to build and evaluate statistical models, with a focus on identifying and analyzing outliers.

3. **KNN_Analysis.R**:
   - Use this script to apply K-Nearest Neighbors analysis, utilizing custom functions for address lookup.

4. **Review Visualizations**:
   - Inspect the residual plots and other visual outputs in the `image` directory to assess model performance and accuracy.

This course is designed to provide a comprehensive understanding of data science techniques, from data cleaning and exploratory analysis to advanced modeling and machine learning methods.
