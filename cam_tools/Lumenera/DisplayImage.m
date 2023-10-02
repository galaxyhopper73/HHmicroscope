function DisplayImage(im)
try
    [m n x] = size(im);
    if (x == 1)
        DisplayMono(im);
    else
        image(im);
    end
catch ME
    rethrow(ME);
end 