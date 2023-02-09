function [plot, message, n_above_1000] = frequency_histogram(n_thrombi, stats_roi)

    %{
        Function description.

        Parameters
        ----------
        stats_roi : Table with all detected particles and their features
            according to Major Axis Length (MAL), Minor Axis Length (MIL) and
            Area.
        n_thrombi : Number of thrombi in the image.

        Returns
        -------
        plot : Plot that sorts each thrombus into a MAL
        category. 
        message : Message to the user telling how many thrombi larger than 1mm are in the
        image.
        n_above_1000 : Number of thrombi larger than 1mm.
    %}

    % Initialize counters
    n_below_200 = 0;
    n_from_200_to_300 = 0;
    n_from_300_to_400 = 0;
    n_from_400_to_500 = 0;
    n_from_500_to_600 = 0;
    n_from_600_to_700 = 0;
    n_from_700_to_800 = 0;
    n_from_800_to_900 = 0;
    n_from_900_to_1000 = 0;
    n_above_1000 = 0;

    % Count thrombi at each size bin
    for i = 1:n_thrombi
        if stats_roi.MajorAxisLength(i) < 200
        n_below_200 = n_below_200 + 1;
        elseif stats_roi.MajorAxisLength(i) < 300
        n_from_200_to_300 = n_from_200_to_300 + 1;
        elseif stats_roi.MajorAxisLength(i) < 400
        n_from_300_to_400 = n_from_300_to_400 + 1;
        elseif stats_roi.MajorAxisLength(i) < 500
        n_from_400_to_500 = n_from_400_to_500 + 1;
        elseif stats_roi.MajorAxisLength(i) < 600
        n_from_500_to_600 = n_from_500_to_600 + 1;
        elseif stats_roi.MajorAxisLength(i) < 700
        n_from_600_to_700 = n_from_600_to_700 + 1;
        elseif stats_roi.MajorAxisLength(i) < 800
        n_from_700_to_800 = n_from_700_to_800 + 1;
        elseif stats_roi.MajorAxisLength(i) < 900
        n_from_800_to_900 = n_from_800_to_900 + 1;
        elseif stats_roi.MajorAxisLength(i) < 1000
        n_from_900_to_1000 = n_from_900_to_1000 + 1;
        else 
        n_above_1000 = n_above_1000 + 1;
        end
    end

    % Combine all variables into one matrix
    data = [n_below_200, n_from_200_to_300, n_from_300_to_400, n_from_400_to_500, n_from_500_to_600, n_from_600_to_700, n_from_700_to_800, n_from_800_to_900, n_from_900_to_1000, n_above_1000];

    % Create a histogram
    plot = bar(data);

    % Add labels to the x-axis and y-axis
    ylim([0 max(data)+1])
    xticklabels({'100-200', '200-300', '300-400', '400-500', '500-600', '600-700', '700-800', '800-900', '900-1000', '>1000'});
    ylabel ('Number of fragments');
    xlabel ('Feret Diameter (um)');

    % Descriptive message
    message = [' There are ', num2str(n_above_1000), ' emboli larger than 1mm.'];
end
