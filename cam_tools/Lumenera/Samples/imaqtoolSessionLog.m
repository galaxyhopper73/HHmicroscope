clear;
vid = videoinput('lumeneraimaq', 1, '1392x1040');
src = getselectedsource(vid);

vid.FramesPerTrigger = 1;
preview(vid);
start(vid);
pause(1);
stop(vid);
stoppreview(vid);
test = getdata(vid);
save('.\untitled.mat', 'test');
image(test);
clear test;


vid.ROIPosition = [464 357 464 420];
preview(vid);
start(vid);
stoppreview(vid);
stop(vid);
delete(vid);
clear;
