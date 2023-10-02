function DisplayRaw(rawImage)
try
    if isa(rawImage.ImageData, 'uint16')
       imagesc(rawImage.ImageData,[0,65535]); colormap(gray); 
    else
       imagesc(rawImage.ImageData,[0,255]); colormap(gray); 
    end
catch ME
    rethrow(ME);
end 