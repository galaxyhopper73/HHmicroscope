 clear;

openImaq;

hardware=imaqhwinfo();
videoAdaptors=hardware.InstalledAdaptors;
videostring=hardware.InstalledAdaptors(1);  % could be winvideo5
myname=char(videostring);
di=imaqhwinfo(myname,1);
s.name = '2592x1944';
s.gain = 3;
s.exp = 100;
s(2).name ='2592x1936 bin x2';
s(2).gain=1;
s(2).exp=15;
s(3).name ='2592x1920 bin x4';
s(3).gain=1;
s(3).exp=5;
%s(4).name = '2592x1944 bin x8';
%s(4).gain=1;
%s(4).exp=1;
nbRes = length(s);

for i=0:1
    for k=1:length(s)
        video = videoinput(myname, 1, s(k).name);
         preview(video);
         pause(1);
         src = getselectedsource(video);
     src.FLIPPING ='Flip';
        g=s(k).gain;
        src.GAIN=s(k).gain;
        e=s(k).exp;
        src.EXPOSURE=s(k).exp;
        pause(10);
        stoppreview(video);
        delete(video);
        pause(1);
    end
end
  
%% Image acquisition test.
a=1;        % mode to get image from.
b=3;        % mode to show preview.
REPS=5;     % nbRep
tic;        % start overal timer
t=zeros(1,REPS);
frame=10;
 for i=1:REPS
     video = videoinput(myname, 1, s(b).name);
     src= getselectedsource(video);
     preview(video);
     src.FLIPPING ='Flip';
     src.GAIN=s(b).gain;
     src.EXPOSURE=s(b).exp;
     pause(2);
     start = tic;
     stoppreview(video);
     delete(video);
     video = videoinput(myname,1,s(a).name);
     src = getselectedsource(video);
     preview(video);
     src.FLIPPING ='Flip';
     src.GAIN=s(a).gain;
     src.EXPOSURE=s(a).exp;
     pause(2); % give time to apply settings.
     clear frame;
     frame = getsnapshot(video);
     stoppreview(video);
     delete(video);
     t(i)=toc(start)
 end
avg =toc/REPS;
plot(t);
figure
image(frame);


closeImaq;

