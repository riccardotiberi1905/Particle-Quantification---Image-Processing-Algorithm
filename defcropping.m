%% Image processing
close all 
clearvars
clc

I = imread('1W92_C.jpg');
rect1 = [200 100 1280 750];
rect2 = [410 176 840 620];
rect3 = [400 140 860 610];
rect4 = [410 260 880 660];
[A, BW11, BIN1] = binarization(I,rect3);
[stats_bin, NumTrombosActualizado, stats_below_500, stats500, stats800, stats1000, Circumference] = table_characteristics(BIN1,BW11);
%% Label - Size Diagram
[h, N] = label_size_diagram(NumTrombosActualizado,stats_bin);
disp(N)

%% Frequency Diagram
[T,plot, K] = frequency_diagram(NumTrombosActualizado, stats_bin);
disp(K)

%% Other interesting parameters
[O,P,Q,R,S] = interesting_parameters(stats_bin,stats1000);
disp(O)
disp(P)
disp(Q)
disp(R)
disp(S)