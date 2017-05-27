# mean_dataset.txt code book

This is the code book for the data in the file mean_dataset.txt.

The raw motion data was gathered in the UCI HAR Dataset which is a 
mobile device dataset generated by motion tracking 20 subjects through 6
different activities.   To read about the experimental conditions, visit this 
URL:

https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script **run_analysis.R**, included in this repository, generates the 
tidy data set containing mean values of certian measurement per subject per activity.   The summary is saved in the file **mean_dataset.txt**.

The full list of column names in mean_dataset.txt is:

Column | Description
--------- | ----------
subject | an id from 1 to 20
activity | what the subject was doing (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
TimeBodyAccelerometerMeanX | for all following data, mean values of the column indicated
TimeBodyAccelerometerMeanY
TimeBodyAccelerometerMeanZ
TimeBodyAccelerometerStdevX
TimeBodyAccelerometerStdevY
TimeBodyAccelerometerStdevZ
TimeGravityAccelerometerMeanX
TimeGravityAccelerometerMeanY                
TimeGravityAccelerometerMeanZ                
TimeGravityAccelerometerStdevX               
TimeGravityAccelerometerStdevY               
TimeGravityAccelerometerStdevZ               
TimeBodyAccelerometerJerkMeanX               
TimeBodyAccelerometerJerkMeanY               
TimeBodyAccelerometerJerkMeanZ               
TimeBodyAccelerometerJerkStdevX              
TimeBodyAccelerometerJerkStdevY              
TimeBodyAccelerometerJerkStdevZ              
TimeBodyGyroscopeMeanX                       
TimeBodyGyroscopeMeanY                       
TimeBodyGyroscopeMeanZ                       
TimeBodyGyroscopeStdevX                      
TimeBodyGyroscopeStdevY                      
TimeBodyGyroscopeStdevZ                      
TimeBodyGyroscopeJerkMeanX                   
TimeBodyGyroscopeJerkMeanY                   
TimeBodyGyroscopeJerkMeanZ                   
TimeBodyGyroscopeJerkStdevX                  
TimeBodyGyroscopeJerkStdevY                  
TimeBodyGyroscopeJerkStdevZ                  
TimeBodyAccelerometerMagMean                 
TimeBodyAccelerometerMagStdev                
TimeGravityAccelerometerMagMean              
TimeGravityAccelerometerMagStdev             
TimeBodyAccelerometerJerkMagMean             
TimeBodyAccelerometerJerkMagStdev            
TimeBodyGyroscopeMagMean                     
TimeBodyGyroscopeMagStdev                    
TimeBodyGyroscopeJerkMagMean                 
TimeBodyGyroscopeJerkMagStdev                
FrequencyBodyAccelerometerMeanX              
FrequencyBodyAccelerometerMeanY              
FrequencyBodyAccelerometerMeanZ              
FrequencyBodyAccelerometerStdevX             
FrequencyBodyAccelerometerStdevY             
FrequencyBodyAccelerometerStdevZ             
FrequencyBodyAccelerometerMeanFreqX          
FrequencyBodyAccelerometerMeanFreqY          
FrequencyBodyAccelerometerMeanFreqZ          
FrequencyBodyAccelerometerJerkMeanX          
FrequencyBodyAccelerometerJerkMeanY          
FrequencyBodyAccelerometerJerkMeanZ          
FrequencyBodyAccelerometerJerkStdevX         
FrequencyBodyAccelerometerJerkStdevY         
FrequencyBodyAccelerometerJerkStdevZ         
FrequencyBodyAccelerometerJerkMeanFreqX      
FrequencyBodyAccelerometerJerkMeanFreqY      
FrequencyBodyAccelerometerJerkMeanFreqZ      
FrequencyBodyGyroscopeMeanX                  
FrequencyBodyGyroscopeMeanY                  
FrequencyBodyGyroscopeMeanZ                  
FrequencyBodyGyroscopeStdevX                 
FrequencyBodyGyroscopeStdevY                 
FrequencyBodyGyroscopeStdevZ                 
FrequencyBodyGyroscopeMeanFreqX              
FrequencyBodyGyroscopeMeanFreqY              
FrequencyBodyGyroscopeMeanFreqZ              
FrequencyBodyAccelerometerMagMean            
FrequencyBodyAccelerometerMagStdev           
FrequencyBodyAccelerometerMagMeanFreq        
FrequencyBodyBodyAccelerometerJerkMagMean    
FrequencyBodyBodyAccelerometerJerkMagStdev   
FrequencyBodyBodyAccelerometerJerkMagMeanFreq
FrequencyBodyBodyGyroscopeMagMean            
FrequencyBodyBodyGyroscopeMagStdev           
FrequencyBodyBodyGyroscopeMagMeanFreq        
FrequencyBodyBodyGyroscopeJerkMagMean        
FrequencyBodyBodyGyroscopeJerkMagStdev       
FrequencyBodyBodyGyroscopeJerkMagMeanFreq    
angletBodyAccelerometerMeangravity           
angletBodyAccelerometerJerkMeangravityMean   
angletBodyGyroscopeMeangravityMean           
angletBodyGyroscopeJerkMeangravityMean       
angleXgravityMean                            
angleYgravityMean                            
angleZgravityMean   