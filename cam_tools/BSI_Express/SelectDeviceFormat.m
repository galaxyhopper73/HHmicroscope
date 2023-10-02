function [format, index] = SelectDeviceFormat(DeviceInfo)
    %This function will provide the user with a list selection dialog box
    %to select the desired device format from the input device info. The
    %device info should be the structure returned from imaqhwinfo
    %
    
    fprintf('Selecting Device Format');

    if(length(DeviceInfo.SupportedFormats) > 1)

        %Ask user to select device format
        [index,tf] = listdlg('ListString',DeviceInfo.SupportedFormats,'SelectionMode','single');
    
        %Check if user selected format
        if(tf)
            format = DeviceInfo.SupportedFormats{index};
        else
            format = DeviceInfo.SupportedFormats{1};
            index = 1;
        end
    elseif(length(DeviceInfo.SupportedFormats) < 1)
        error('No device formats found');
    else
        format = DeviceInfo.SupportedFormats{1};
        index = 1;
    end

    fprintf(': %s \n',format);

end