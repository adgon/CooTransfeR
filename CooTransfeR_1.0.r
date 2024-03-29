
# Welcome to CooTransfeR. This script was coded by Dr. Adrian Gonzalo (ETH, Zurich)

#Use this script to transfer your coordinates from a Leica system to Deltavision OMX.

#This work is licensed under a Creative Commons Attribution CC0 1.0 Universal.
# For details, see: https://creativecommons.org/licenses/by/4.0/

library(readxl)
library (dplyr)
library(readr)

input <- "C:/Users/xxxx/xxxxx/xxxxxx" # <----Enter the path to the input folder 
output <- "C:/Users/xxxxx/xxxxxxx/xxxxx"# <----Enter the path to the output folder 
files <- list.files(input) # Lists al the files contained
file_name<- gsub ("\\.txt", "", files) # Lists the names of the sequences without the .txt

for(i in 1: length (files)){
  print(i)
  files[i]

  original <- read_csv(paste (input,"/", files[i], sep="")) # uploads the first file in the input folder (access the adress pasted)
  p<-paste(unlist(original)) [[5]] ## to eliminate the useless part of the document (the important part is in the 5 element)
  
  
  ### for the X positions
  
  locX<- unlist (gregexpr(pattern ='StageXPos',p))## to list the locations within the string of StageXPos
  posX <- 1:length(locX) ##creates a vector to store the positions
  
  ##loop to extract the positions
                      for (j in 1:length(locX)){
                        posX[j]<- substr (p, locX[[j]]+11, locX[[j]]+25) # it returns the 11th and 25th characters after the locations listed
                        posX[j]<- gsub("[^0-9.]", "",  posX[j]) #it removes the non-numeric part of the extracted string
                      }
                      
                      posX <- as.numeric((posX)) *1000 # to coerce as numeric
  
  
  ### for the Y positions
  
  locY<- unlist (gregexpr(pattern ='StageYPos',p))## to list the locations within the string of StageYPos
  substr (p, locY[[1]]+11, locY[[1]]+25) ## returns the characthers 11nth to 25th in the string
  
  
  posY <- 1:length(locY) ##creates a vector to store the positions
  
  #loop to extract the positions
                      for (k in 1:length(locY)){
                        posY[k]<- substr (p, locY[[k]]+11, locY[[k]]+25) # it returns the 11th and 25th characters after the locations listed
                        posY[k]<- gsub("[^0-9.]", "",  posY[k]) #it removes the non-numeric part of the extracted string
                      }
  
  posY <- as.numeric((posY)) *1000 ## to coerce as numeric
  OMX <- paste (posX, ",", posY, sep="")
  
  ### To generate the final table with the coordinates
  
  coordinate <- 1: length(posY) ## to create one more vector with the coordinate number
  table<- data.frame (coordinate, posX, posY, OMX) #to put all the vectors together into a dataframe
  
  output_root_xl<- paste (output,"/", file_name[i], ".csv", sep="")
  write_excel_csv(data.frame (coordinate, OMX), output_root_xl)
  
  
  print(i)
}





