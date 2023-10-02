openImaq;

hardware=imaqhwinfo();
videoAdaptors=hardware.InstalledAdaptors;
%find lumeneraimaq adaptor.

videostring=hardware.InstalledAdaptors(2);  % could be winvideo5
myname=char(videostring);
di=imaqhwinfo(myname,1);
vid=videoinput(myname,1,char(di.SupportedFormats(2)));
src=getselectedsource(vid);
preview(vid);
start(vid);
    pause(3);
    src.WBIterations =5;
    pause(10);
    frame = getsnapshot(vid);
    image(frame);

stoppreview(vid);
pause(1);

preview(vid);
pause(5);


stoppreview(vid);
stop(vid);
delete(vid);

closeImaq;

% Access an image acquisition device.
%vidobj = videoinput('winvideo');

% Convert the input images to grayscale.
%set(vidobj, 'ReturnedColorSpace', 'grayscale')


% Retrieve the video resolution.
%vidRes = get(vidobj, 'VideoResolution');

% Create a figure and an image object.
%f = figure('Visible', 'off');

% The Video Resolution property returns values as width by height, but
% MATLAB images are height by width, so flip the values.
%imageRes = fliplr(vidRes);

%subplot(1,2,1);

%hImage = imshow(zeros(imageRes));

% Set the axis of the displayed image to maintain the aspect ratio of the
% incoming frame.
%axis image;



%set(obj1,'SelectedSourceName','input1');
%set(obj2,'SelectedSourceName','input2');
%src1=getselectedsource(obj1);
%src2=getselectedsource(obj2);
%preview(obj1);
%preview(obj2);
%pause(3);
%start(obj1);
%start(obj2);
%data=getdata(obj1);
%imaqmontage(data);
%frame = getsnapshot(obj1);
%image(frame);
%stop(obj1);
%delete(obj1);