function [figure_pair, negative_binary_image, negative_roi_binary_image] = binarization(image, roi)
    %{
        Function description.

        This function receives an RGB image with a region of
        interest (ROI), passes it to grayscale, creates cropped 
        image according to ROI, performs binarization of such 
        image (with a threshold of 140 / 256) and computes negative
        of both images.

        Parameters
        ----------
        image : 3-channel uint8 matrix
            Original image.
        roi : single channel uint8 matrix, with shape of image.
            Region of interest.

        Returns
        -------
        figure_pair : figure
            Figure with both cropped grayscale image and negative 
            of binarized cropped image.
        negative_binary_image : single channel uint8 matrix
            Complementary binary image of original image.
        negative_cropped_binary_image : single channel uint8 matrix
            Complementary binary image of cropped image.

    %} 
    % Pass rgb image to grayscale
    image = rgb2gray(image);
    % Crop roi from image
    roi_image = imcrop(image, roi);

    % Binarizes complete image
    binary_image = imbinarize(image, 140 / 256);
    % Computes complementary (negative) from binary image
    negative_binary_image = imcomplement(binary_image);
    % Repeats for cropped image. Binarizes cropped image
    roi_binary_image = imbinarize(roi_image, 140 / 256);
    % Computes complementary (negative) from cropped binary image
    negative_roi_binary_image = imcomplement(roi_binary_image);

    % Creates figure with both cropped grayscale image and negative of 
    % binarized cropped image.
    figure
    figure_pair = imshowpair(roi_image, negative_roi_binary_image, 'montage');
    title('Gray image vs binary cropped image')

end
