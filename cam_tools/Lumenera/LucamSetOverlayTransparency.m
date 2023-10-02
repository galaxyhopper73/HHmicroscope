% transparency - 8-bit integer (0-255), where 0 is transparent, and 255 is
% opaque.
function LucamSetOverlayTransparency (transparency, cameraNum)
% LucamSetOverlayTransparency - Sets the transparency of any pixels already
% deemed non-fully-transparent in a transparent image (32-bit bitmap or non-white
% pixels when white pixel transparency is enabled).
% pixels in the image are transparent.
try
    LuDispatcher(111, cameraNum, transparency);
catch ME
    rethrow(ME);
end    
