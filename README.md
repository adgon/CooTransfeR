# CooTransfeR

Instructions to use CooTransfeR
This software extracts the coordinates saved in Leica coordinate files (in maf format), and produces a table where you can easily access them and paste them in the OMX software. Please carefully read the instructions. In case of any question of inquiry contact Adrian Gonzalo (adrian.gonzalo@biol.ethz.ch).
1.	Prepare your Leica coordinate files in maf format.
2.	Create an input folder.
3.	Optional: create an output folder.
4.	Paste the maf files that you want to convert in that input folder. This folder should only contain your maf files. 
5.	In the script, modify the paths to the input and output folders. Note: use “/” instead of “\”.
6.	Run the whole script.
7.	Find the output csv files corresponding to each input maf files.
8.	Open the csv files, you will see two columns, one column indicates the ID number of your Region Of Interest (ROI), the second column is for the X and Y coordinates of that position. 
9.	Go to you OMX system and go to “Tools” and “OMX Coordinate Mapping”.
10.	Copy the coordinates from one of your ROIs from the csv file and paste it to the OMX Coordinate Mapping tool, in the section “Map a DV point to OMX” in the DVx,y; slot. 
11.	Press “Calculate OMX pint” to convert coordinates. Note: make sure that you have previously calibrated the OMX Coordinate Mapping tool, by entering the Leica coordinates of 3 ROIs (“3 DV points” slot) and the OMX coordinates from the same ROIs (“3 OMX points” slot) and press “Calculate matrix”. You can save the matrix coefficients for later uses.
12.	Press “Go to OMX point” to go to your ROI.
13.	Sometimes you will need to introduce a little correction, in the “Nano positioning” that varies with each slide but it is exactly the same for all the ROIs in the same slide. For instance + 400dX and +200 dY.
