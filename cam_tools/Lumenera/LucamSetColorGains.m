function LucamSetColorGains (colorGainStruct, cameraNum)
% LucamSetColorGains - Set all colour gains for video or snapshot mode.
% colorGainStruct - Data structure that contains all information about color gains.
% cameraNum - Camera index number.
try
    LuDispatcher(20, cameraNum, colorGainStruct);
catch ME
    rethrow(ME);
end