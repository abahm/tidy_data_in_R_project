This is the final project for the **Getting and Cleaning Data** class on Coursera ([url here](https://www.coursera.org/learn/data-cleaning).

## R script
The file run_analysis.R is a stand-alone R script which parses the data from the [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), merges the training and test data, transforms it, cleans it, and outputs a summary dataset of the means of "mean" and "std" measurements.   The script is commented to clarify each step in this process.

The resulting output file mean_dataset.txt is 285 Kb.   The script takes about 15 seconds to complete.

## Code book
There is a [code book](CodeBook.md) to interpret the output.

