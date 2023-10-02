function [handle] = LucamConnect(cameraNum)
% LucamConnect - Connect to the Lumenera camera specified.
try
    LucamCameraOpen(cameraNum);
    handle = cameraNum;
catch ME
    %msgText = getReport(ME,'basic', 'hyperlinks', 'on');
    %error(msgText);
    rethrow(ME);
end
