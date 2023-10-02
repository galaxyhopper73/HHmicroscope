function [handle] = LucamCameraOpen(cameraNum)
% LucamCameraOpen - Connect to the Lumenera camera specified.
try
    LuDispatcher(-1, cameraNum);
    handle = cameraNum;
catch ME
    %msgText = getReport(ME,'basic', 'hyperlinks', 'on');
    rethrow(ME);
end