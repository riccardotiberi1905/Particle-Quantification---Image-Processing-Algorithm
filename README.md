# MATLAB Image Processing Algorithm - Particle Quantification

This MATLAB script analyzes the particles in a given image according to size and count of particles. 

## Requirements
- MATLAB software (available for download at https://www.mathworks.com/products/matlab.html)

## Usage
1. Download all files and place them in your working directory.
2. Open the script "main.m" in MATLAB and modify the `image` variable according to your image name to represent your desired data.
3. Run the script by pressing the "Run" button or by typing `run main.m` in the command window.

## Output
The script will group all particles into size categories and it will produce a bar plot with the proportion for each category  represented on the y-axis, and the index of each element represented on the x-axis. Besides, several messages will be displayed with useful information about the particles, like the length of the largest particle.

## Extra
The repository provides a jpg image called "1W92_C.jpg" so that the interested user can test the algorithm.

## Limitations
The algorithm is designed to exclusively process the specific image format included in this repository. Moreover, an 8mm circle is utilized as a reference for length measurements in subsequent image analyses. Additionally, the code implementation is sensitive to image dimensions.

## Contact
If you have any questions or issues with this script, please feel free to reach out to me via email at [riccardotiberi1905@gmail.com].

