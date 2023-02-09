function [h, message, n_thrombi] = label_size_diagram(n_thrombi, stats_roi)
    %{
        Function description.

        Creates diagram that represents every labeled thrombus with its corresponding
        major axis length in um. The black ones represent the thrombi below
        200um. The red ones; below 500um. The green ones; below 100um. The blue
        ones; above 1000um.

        Parameters
        ----------
        stats_roi : Table with all detected particles and their features
            according to Major Axis Length (MAL), Minor Axis Length (MIL) and
            Area.
        n_thrombi : Number of thrombi in the image.

        Returns
        -------
        h: Diagram that sorts every labeled particle in terms of MAL
        message: Message to the user telling how many thrombi are in the
        image.
        n_thrombi : Number of thrombi in the image

    %}
    % Create diagram
    figure
    hold on
    for i = 1:n_thrombi
        h = bar(i, stats_roi.MajorAxisLength(i));
        if (stats_roi.MajorAxisLength(i)) < 200
            set(h, 'FaceColor', 'k');
        elseif stats_roi.MajorAxisLength(i) < 500
            set(h, 'FaceColor', 'r');
        elseif stats_roi.MajorAxisLength(i) < 1000
            set(h, 'FaceColor', 'g' )
        else
            set(h, 'FaceColor', 'b');
        end
    end
    title('Thrombi')
    xlabel('Label (Thrombus)')
    ylabel('Size (micrometers)')
    hold off
    hold off
    
    % Descriptive message
    message = [' A total of ', num2str(n_thrombi), ' emboli were generated.'];

end

