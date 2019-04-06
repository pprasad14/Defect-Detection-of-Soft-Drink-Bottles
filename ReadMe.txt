Running with UI:

1.) To run the program from the GUI, go run the 'UI.m' file that is present in 'Project Codes/UI/Ui.m'
2.) On successful execution, the simple GUI we created should display on the screen
3.) Select the "Select Image" button to select a sample image to test
4.) The results of the fault test will be displayed on the right hand side of the GUI within the text display box



Testing the result within MATLAB command Window:

1.) Finding all faults for one given image:

The main function is the 'find_faults.m' function that takes in as input an RGB image and outputs a 6x2 matrix of results, one row for each fault. It states the fault being examined followed by the result obtained after execution. In order to run it on command window, use the 'imread()' function to read the image, and call the 'find_faults()' function. Example if the image is read as 

I = imread('normal-image1.jpg');

then call the main function like: 

find_faults(I)

This will print out the calculated results on the command window as a matrix of strings of the fault type being identified along with the result found via computation


2.) To test the results of all the Training images' classification:

I have created another script called 'faults_check.m' that tests the classification output for each image in a particular fault folder containing the faulty bottle image.  This is not a function and does not require any input. In this particular script, I have divided the file into sections for each fault. Please select the code for each section and run that particular segment to view the results for the fault and normal images. 

0: represents no fault
1: fault present
-1(for underfilled): fault present

Note that when running this, we get perfect results when detecting faults.





 