function DisplayMono(monoImage)
try
    if isa(monoImage, 'uint16')
       imagesc(monoImage,[0,65535]); colormap(gray); 
    else
       imagesc(monoImage,[0,255]); colormap(gray); 
    end
catch ME
    rethrow(ME);
end 