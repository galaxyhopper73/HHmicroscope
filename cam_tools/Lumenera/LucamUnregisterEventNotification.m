function LucamUnregisterEventNotification(cameraNum, eventID)
% LucamUnregisterEventNotification - Unregisters an event for the camera.
% eventID is the ID assigned from LucamRegistEventNotification.
try
    LuDispatcher(93, cameraNum, eventID);
catch ME
    rethrow(ME);
end    
