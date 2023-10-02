LucamConnect(1);                    % Connect to camera
bit16=2^16;                         % Calculate max value of 16 bit data.
bits=LucamGetTruePixelDepth(1)      % Get camera true bit depth.
bitTrue=2^bits;                     % calculate max value of bit depth data.
bitAdjust = 2^(16-bits);            % Calculate required data adjustement from 16 bit data image to true bit depth.
LucamSet16BitSnapshot(true,1);      % Set snapshot capture in 16 bit mode.
LucamSetSnapshotGain(2,1);          % Set wanted snapshot gain.
LucamSetSnapshotExposure(35,1);     % Set Integration time for snapshot.
imsnap=LucamTakeSnapshot(1);        % Capture the snapshot image.
nbIteration = 30;
maxExposure = 500
avg=[1:nbIteration];
%get(0, 'format')
% format hex

StartExposure = 0;
%avg = zeros(0,nbIteration);
for i=1:nbIteration
    startExposure = i * (maxExposure/nbIteration);
    LucamSetSnapshotExposure(startExposure,1);
    t = LucamTakeSnapshot(1);
    avg(i)=mean2(t);
end

LucamDisconnect(1);
imsnapMono = imsnap(:,:,1);         % Take only one channel for monochrome camera.
imsnapMonoTrue= imsnapMono/bitAdjust;   % Adjust image to be in camera bitdepth value.
figure('Name','Capture Image');     % Display snapshot has acquired.
image(imsnap);

%figure('Name','channel isolated image');               % Display one channel of the acquired image.
%imagesc(imsnapMono,[0,bit16]);colormap(gray);

figure('Name','Histogram 16 bit image'),imhist(imsnapMono,bit16);
counts = imhist(imsnapMono,bit16);
maxy = max(counts);
maxX= max(max(imsnapMono));
minX = min(min(imsnapMono));
set(gca,'YLim',[0 maxy],'Layer','top');
set(gca,'XLim',[minX maxX],'Layer','top');
%figure('Name','true bit gray image');               % Display one channel of the acquired image.
%imagesc(imsnapMonoTrue,[0,bitTrue]);colormap(gray);
%figure('Name','true bit bone image');           % Display one channel in true bitdepth image using 
%imagesc(imsnapMonoTrue,[0,bitTrue]);colormap(bone);
%figure('Name','true bit jet image');
%imagesc(imsnapMonoTrue,[0,bitTrue]);colormap(jet);

counts = imhist(imsnapMonoTrue,bitTrue);
maxy = max(counts);
maxX= max(max(imsnapMonoTrue));
minX = min(min(imsnapMonoTrue));
figure('Name', 'Histogram true bit image'), imhist(imsnapMonoTrue,bitTrue);
set(gca,'YLim',[0 maxy]);
set(gca,'XLim',[minX maxX]);

%figure('Name','Some test');
%[counts, x]=imhist(imsnapMono,bit16);
%stem(x,counts);
max(max(imsnapMono))
mean2(imsnapMono)


max(max(imsnapMonoTrue))
mean2(imsnapMonoTrue)

figure('Name', 'Exposure Variation');
%hist(avg,nbIteration);
x=1:nbIteration;
y=avg(x);
plot(y);

    


