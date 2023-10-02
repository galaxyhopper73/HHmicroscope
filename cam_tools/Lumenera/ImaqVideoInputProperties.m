function props = ImaqVideoInputProperties(videoInput)
%Get list of camera properties
% videoInput    Imaq camera object, see ImaqGetVideoInput()
    try
        props = getselectedsource(videoInput);
    catch Ex
        rethrow(Ex)
    end
end