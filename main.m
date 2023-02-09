% Clear environment
close all 
clearvars
clc

%% Image processing pipeline

% The code starts with the image detection and a subsequent binarization to differentiate the particles from the background. 
% With the application of MATLAB bwlabel and regionprops various relevant parameters are obtained to characterize the particles. 

% Read example image
image = imread('1W92_C.jpg');

% Define different regions of interest (roi) 
% The region of interest is set to only take into account the region of the
% image where particles are located. Several rois are displayed for
% different image types with diverse dimensions.

roi_1 = [200 100 1280 750];
roi_2 = [410 176 840 620];
roi_3 = [400 140 860 610];
roi_4 = [410 260 880 660];

% Perform binarization
[figure_pair, negative_binary_image, negative_roi_binary_image] = binarization(image, roi_3);

% Extract thrombi characteristics in roi
[stats_roi, n_thrombi, stats_below_500, stats_500, stats_800, stats_1000, major_axis_length] = table_characteristics(negative_binary_image, negative_roi_binary_image);

%% Label - Size Diagram
[h, message_size] = label_size_diagram(n_thrombi, stats_roi);
disp(message_size)

%% Frequency Diagram
[plot, message_frequency] = frequency_histogram(n_thrombi, stats_roi);
disp(message_frequency)

%% Other interesting parameters
[message_largest, message_smallest, message_mean, message_area, message_area_larger_than_1] = interesting_parameters(stats_roi, stats_1000);
disp(message_largest)
disp(message_smallest)
disp(message_mean)
disp(message_area)
disp(message_area_larger_than_1)
