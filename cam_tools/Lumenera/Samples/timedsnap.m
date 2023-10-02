LucamCameraOpen(1);
still = LucamGetStillImageFormat(1);
LucamSetSnapshotExposure(10,1);
LucamSetSnapshotGain(18,1);

tic;
im = LucamTakeSnapshot(1);
t1 = toc;

tic;
raw = LucamSnapRawFrame(1);
t2 = toc;

LucamTurboSetup(1,1);
tic;
LucamTurboAcquire(1);
t3=toc;

t4 = t1-t2;
t5 = t1-t3;
im3= LucamTurboProcess(1,0);
LucamTurboCleanup(1);

figure ('Name','full take snap shot');
imagesc(im,[0,255]); colormap(gray);
im2 = LucamConvertFrameToRgb(1, raw);
figure ('Name', 'Use raw snap shot');
imagesc(im2,[0,255]); colormap(gray);
figure ('Name', 'Turbo snapshot');
imagesc(im3,[0,255]); colormap(gray);
t1
t2
t3
t4
t5

nbframe = 10;
tic;
for n=0:nbframe
   im=LucamTakeSnapshot(1);
end
t1=toc;

tic
for n=0:nbframe
    raw = LucamSnapRawFrame(1);
end
t2=toc;

LucamTurboSetup(1,nbframe);
tic
LucamTurboAcquire(1);
t3 = toc;
for n=1:nbframe
   im = LucamTurboProcess(1,n-1);
   figure ('Name','turbo');
   imagesc(im,[0,255]); colormap(gray);
end
LucamTurboCleanup(1);
t1
t2
t3
t4=t1-t2
t5=t1-t3


LucamCameraClose(1);
