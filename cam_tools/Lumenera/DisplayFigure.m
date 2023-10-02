function fig = DisplayFigure(title, imageData)
try
    fig = figure('name', title);
    DisplayImage(imageData);
catch ME
    rethrow(ME);
end 