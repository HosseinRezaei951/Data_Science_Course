# Statistical Modeling and KNN Analysis of Manhattan Real Estate Sales Data

This project focuses on the statistical modeling and K-Nearest Neighbors (KNN) analysis of Manhattan real estate sales data using R. The goal is to perform data processing, exploratory data analysis, modeling, and visualization to extract meaningful insights from the dataset.

## Directory Structure

### Project Files

- **rollingsales_manhattan.xls**: The dataset containing real estate sales records for Manhattan. This file serves as the primary input for the analysis.

- **Data_Cleaning_and_EDA.R**: The main R script that:
  - **Loads Data**: Reads the `rollingsales_manhattan.xls` dataset.
  - **Cleans Data**: Converts relevant fields to numeric formats, handles missing values, and standardizes column names.
  - **Performs Exploratory Data Analysis (EDA)**: Generates summary statistics and visualizations, such as histograms and scatter plots, to explore data distributions.
  
- **Statistical_Modeling.R**: This R script is focused on building and evaluating statistical models:
  - **Outlier Detection**: Identifies and removes outliers based on specific criteria to improve model accuracy.
  - **Model Building**: Constructs and refines various statistical models to analyze the relationship between variables such as sale price, gross square footage, and others.

- **KNN_Analysis.R**: This script implements a K-Nearest Neighbors (KNN) model:
  - **Custom Functions**: Utilizes functions from `KNN/addrListLookup_Func.R` for address lookup.
  - **KNN Modeling**: Applies KNN techniques to predict or analyze the data based on neighborhood proximity or other related features.

- **KNN/addrListLookup_Func.R**: Contains a custom function or set of functions used for address lookup in the KNN model. This script is part of a larger analysis or preprocessing step.

### Visualizations

The `image` directory contains the plots generated during the analysis:

- **image/model1_abline.png**: Plot illustrating the best-fit line (abline) for Model 1, showing the relationship between the predictor and response variables.

- **image/model1_resid.png**: Residual plot for Model 1, used to diagnose the fit of the model and check for patterns in the residuals.

- **image/model2_resid.png**: Residual plot for Model 2, providing insights into the model's performance and any potential issues with the residuals.

- **image/model2a_resid.png**: A variant of the residual plot for Model 2, possibly representing a different subset or modified model.

- **image/model3_resid.png**: Residual plot for Model 3, useful for assessing the accuracy and reliability of the model.

- **image/model4_resid.png**: Residual plot for Model 4, offering a final assessment of the model's performance in the analysis.

## Instructions for Use

1. **Set Up**:
   - Ensure that the required R packages (`plyr`, `gdata`, etc.) are installed in your R environment.
   - Navigate to the directory containing the scripts and data files.

2. **Running the Analysis**:
   - Start with `Data_Cleaning_and_EDA.R` to load, clean, and perform initial exploratory data analysis on the dataset.
   - Proceed with `Statistical_Modeling.R` for outlier detection and model evaluation.
   - Finally, use `KNN_Analysis.R` to perform K-Nearest Neighbors analysis if needed.

3. **Reviewing Visualizations**:
   - Open the images in the `image` directory to examine the plots generated during the analysis.
   - The residual plots (`model1_resid.png`, `model2_resid.png`, etc.) are critical for assessing the model fits and identifying areas for improvement.

4. **Analyzing Results**:
   - Use the insights gained from the exploratory data analysis and modeling to draw conclusions about real estate trends in Manhattan.
   - Focus on understanding the relationship between variables such as sale price, property size, and location, and how these factors interact across different models.

This exercise is designed to enhance your data analysis and modeling skills using R, providing practical experience with real-world data and complex analytical techniques.
