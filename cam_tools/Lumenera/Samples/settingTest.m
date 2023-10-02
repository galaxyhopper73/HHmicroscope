clear;clc;            
LucamCameraOpen(1);	
            ff=LucamGetFormat(1);
            ff.width = 1024;   % x
            ff.height = 1024;  % y
            LucamSetFormat(ff,1);
%             ff.xOffset = 296;
%             ff.yOffset = 96;
%             ff.xBinSub = 1;
%             ff.yBinSub = 1;
            LucamSetOffset(296,96,1);	


%             LucamSetFormat(ff,1);
            LucamShowPreview(1); 
            LucamHidePreview(1);
            
            rates = LucamListFrameRates(1);
            LucamSetFrameRate(max(rates), 1);
            rates = LucamEnumAvailableFrameRates(1);
            LucamCameraReset(1);
            test = LucamGetFormat(1);