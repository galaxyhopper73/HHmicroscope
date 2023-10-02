% Call as such: [width,height] = LucamGetFrameSize(<cameraNum>);
function [width, height] = LucamGetFrameSize(cameraNum)
%LucamGetFrameSize - Returns the current width and height of the camera's ROI.
try
    size = LuDispatcher(12, cameraNum);
    width = size(1);
    height = size(2);
catch ME
    width =0;
    height =0;
    rethrow(ME);
end    
