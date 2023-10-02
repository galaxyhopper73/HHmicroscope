function [PmImaqInfo] = GetPMAdaptorInfo()

    fprintf('Getting Adaptor Information for Teledyne Photometrics Cameras\n');

    %Check that the image acquisition toolbox is installed
    if(~license('test', 'Image_Acquisition_Toolbox'))
        error('Image Acquisition Toolbox is not installed');
    end
    
    %Get image acquisition toolbox information
    ImAdaptorInfo = imaqhwinfo
    
    %Get number of registered devices
    adaptors = length(ImAdaptorInfo.InstalledAdaptors);
    
    %Give user a warning if no devices were found
    if(adaptors == 0)
        error('No devices registered. Please register PM device using imaqregister');
    end
    
    %Find PM Image Acquisition Adapter
    for ii = 1:adaptors
        if(~isempty(strfind(ImAdaptorInfo.InstalledAdaptors{ii}, 'pmimaq')))
            PmImaqInfo = imaqhwinfo(ImAdaptorInfo.InstalledAdaptors{ii})
            break
        end
    end
    
    %Check that the PM Image Acquisition Adapter was found
    if(~exist('PmImaqInfo','var'))
        error('PM Image Acquisition Adapter not found in registered device list');
    end
    
end