function [message_largest, message_smallest, message_mean, message_area, message_area_larger_than_1] = interesting_parameters(stats_roi, stats_1000)
    %{
        Function description.

        Parameters
        ----------
        stats_roi : Table with all detected particles and their features
            according to Major Axis Length (MAL), Minor Axis Length (MIL) and
            Area.
        stats_1000 : Table for all thrombi with MAL > 1000um

        Returns
        -------
        message_largest : Message to the user telling how long is the
        largest thrombus in the image.
        message_smallest : Message to the user telling how small is the
        smallest thrombus in the image.
        message_mean : Message to the user telling what is the average MAL
        to be found among the thrombi in the image.
        message_area : Message to the user telling the area in mm^2 formed
        by every particle.
        message_area_larger_than_1 : Message to the user telling the area
        in mm^2 formed by the thrombi larger than 1mm.
        
    %}
    % Largest embolus
    Maximo = max(stats_roi.MajorAxisLength) * 10^-3;
    % Smallest embolus
    Minimo = min(stats_roi.MajorAxisLength) * 10^-3;
    % Mean embolus size
    Media = mean(stats_roi.MajorAxisLength) * 10^-3;
    % Total area of all emboli
    Total_Area = (sum(stats_roi.Area)) * 10^-6;
    % Total area of all emboli larger than 1mm
    Total_Area_1000 = (sum(stats_1000.Area)) * 10^-6;

    % Descriptive messages
    message_largest = ['The largest emboli measures ',num2str(Maximo), ' mm.'];
    message_smallest = ['The smallest emboli measures ',num2str(Minimo), ' mm.'];
    message_mean = ['Mean emboli size = ', num2str(Media), ' mm.'];
    message_area = ['Total area = ', num2str(Total_Area), ' mm^2.'];
    message_area_larger_than_1 = ['Total area of thrombi larger than 1mm = ', num2str(Total_Area_1000), ' mm^2.'];

end
