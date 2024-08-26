# Manhattan Real Estate Data Analysis

This exercise focuses on the analysis of Manhattan real estate sales data using R. It covers data cleaning, exploration, visualization, and outlier detection to extract meaningful insights from the dataset.

## Directory Structure

### Project Files

- **DataProcessing.R**: The main R script that performs the following tasks:
  - **Data Loading**: Reads and loads the `rollingsales_manhattan.xls` dataset into R.
  - **Data Cleaning**: Converts relevant fields to numeric formats, handles missing values, and standardizes column names.
  - **Exploratory Data Analysis (EDA)**: Generates summary statistics and visualizes data distributions using histograms and scatter plots.
  - **Outlier Detection**: Identifies and removes data points that are considered outliers based on specific criteria.
  - **Focused Analysis**: Examines specific property types, such as 1-, 2-, and 3-family homes, and explores their sale price distributions.

- **rollingsales_manhattan.xls**: The dataset containing real estate sales records for Manhattan, which is used as input for the analysis.

### Visualizations

The `pics` directory contains the plots generated from the analysis:

- **Plots Directory** (`pics/plots/`):
  - **plot1.png**: Initial histogram of all sale prices.
  - **plot2.png**: Histogram of sale prices greater than zero.
  - **plot3.png**: Histogram of gross square footage for properties with zero sale price.
  - **plot4.png**: Scatter plot of gross square footage vs. sale price for properties with valid sale prices.

- **Sale Price Plots**:
  - **sale_price.png**: Scatter plot of gross square footage vs. sale price.
  - **sale_price2.png**: Log-transformed scatter plot of gross square footage vs. sale price.
  - **sale_price3.png**: Refined plot after outlier removal, showing the relationship between gross square footage and sale price.

## Instructions for Use

1. **Set Up**:
   - Ensure that the required R packages (`plyr`, `gdata`) are installed in your R environment.

2. **Running the Script**:
   - Execute the `DataProcessing.R` script to perform the full analysis, including data loading, cleaning, and visualization.
   - The script will generate several plots and save them in the `pics` directory, offering visual insights into the dataset.

3. **Analyzing the Results**:
   - Review the generated plots in the `pics` directory to understand the distribution of sale prices, detect anomalies, and explore trends in the data.
   - Use these insights to draw conclusions about real estate trends in Manhattan, particularly in relation to property size and sale price.

This exercise is designed to strengthen your data processing and analytical skills using R, with a real-world dataset that requires careful handling and interpretation.
