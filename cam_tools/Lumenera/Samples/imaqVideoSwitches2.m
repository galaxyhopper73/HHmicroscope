clear ;
openImaq; % call script that register imaq plugin.

hardware=imaqhwinfo();
videoAdaptors=hardware.InstalledAdaptors;
AdaptorIndex=0;
file='lumeneraimaq'
for i=1:length(videoAdaptors)
    if (strcmp(file, videoAdaptors(i)) == 1)
        AdaptorIndex = i;
    end
end
videostring=hardware.InstalledAdaptors(AdaptorIndex);  % could be winvideo5
myname=char(videostring);
clear videostring;
di=imaqhwinfo(myname,1);
supportedFormat= di.SupportedFormats;
myFormat = char(supportedFormat(12));
vid = videoinput(myname,1,myFormat);
src = getselectedsource(vid);
%src.Flipping = 2;

figure('Name', 'This is my Preview video');
uicontrol('String', 'Close', 'Callback', 'close(gcf)');
vidRes=get(vid, 'VideoResolution');
nBands=get(vid,'NumberOfBands');
b= zeros(vidRes(2), vidRes(1),nBands);
hImage = image(b);
preview(vid,hImage);
src.FLIPPING= 'Flip';
%figure('Name', 'image');
%im=image(b);
del=1;
stoppreview(vid);
pause('query');
for i=0:3

         %src.BINNING='Off';
         %src.SAMPLING='X1';    
         preview(vid,hImage);

         src.GAIN=3;
         src.EXPOSURE=100;
         pause(del);
         %figure('Name', 'image');
         frame1 = getsnapshot(vid);
         %delete(im);
         %im = image(frame);
        
         stoppreview(vid);
        % closepreview(vid);
         
         
         %src.SAMPLING='X2';
         %src.BINNING='On';
         preview(vid,hImage);

         src.GAIN=1;
         src.EXPOSURE = 50;
         pause(del);
         %figure('Name', 'image');
         frame2 = getsnapshot(vid);
         %delete(im);
         %im = image(frame);
        stoppreview(vid);
        %closepreview(vid);
        
        %src.SAMPLING='X8';
        %src.BINNING='On';
        preview(vid,hImage);
        src.GAIN=1;
        src.EXPOSURE=5;
        pause(del);
        %delete(im);
        %figure('Name', 'image');
        frame3 = getsnapshot(vid);
        %im = image(frame);
        stoppreview(vid);
        %closepreview(vid);
        
end
figure('Name','Image 1');
image(frame1);
figure('Name','Image 2');
image(frame2);
figure('Name','Image 3');
image(frame3);

delete(vid);
closeImaq; % call script that unregister imaq plugin.


