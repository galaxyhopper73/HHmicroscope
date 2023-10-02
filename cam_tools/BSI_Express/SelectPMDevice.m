function [PMDeviceInfo,PMDeviceID, DeviceIndex] = SelectPMDevice(PmImaqInfo)
    
    fprintf('Selecting PM Camera');
    
    %Get length device formats
    devices = length(PmImaqInfo.DeviceInfo);
    deviceList = {};
    %Display information for all detected PM devices
    if(devices > 1)
        for ii = 1:devices
            deviceList{end+1} = PmImaqInfo.DeviceInfo(ii).DeviceName;
        end

        %Ask user to select device format
        [DeviceIndex,tf] = listdlg('ListString',deviceList,'SelectionMode','single');

        %Check if user selected format
        if(tf)
            PMDeviceInfo = PmImaqInfo.DeviceInfo(DeviceIndex);
            PMDeviceID = PmImaqInfo.DeviceIDs{DeviceIndex};
        else
            %Default to first device if not selected
            PMDeviceInfo = PmImaqInfo.DeviceInfo(1);
            PMDeviceID = 1;
        end
    
    elseif(devices < 1)
        error('Error: No PM Devices detected');
    else
        %Default to only device
        PMDeviceInfo = PmImaqInfo.DeviceInfo(1);
        PMDeviceID = 1;
        DeviceIndex = 1;
    end

    fprintf(':\t %s \n',PmImaqInfo.DeviceInfo(DeviceIndex).DeviceName)

end