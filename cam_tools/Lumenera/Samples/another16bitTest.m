LucamCameraOpen(1);
LucamSetSnapshotExposure(10,1);
LucamSetSnapshotGain(2,1);
LucamSetExposure(10,1);
LucamSetGain(2,1);
LucamSetGamma(2,1);

LucamSet16BitCapture(false,1);
LucamShowPreview(1);
a=LucamTakeVideo(1,1);
LucamHidePreview(1);
LucamSet16BitCapture(true,1);
LucamShowPreview(1);
b=LucamTakeVideo(1,1);
LucamHidePreview(1);


LucamSet16BitSnapshot(false,1);
e= LucamTakeSnapshot(1);
LucamSet16BitSnapshot(true,1);
f= LucamTakeSnapshot(1);

figure('Name', 'Video Capture 8 bit');
image(a);
figure('Name', 'Video Capture 16 bit');
image(b);
figure('Name', 'Snapshot 8 bit');
%image(e);
imagesc(f,[0,255]); colormap(gray);
figure('Name', 'Snapshot 16 bit');
%image(f);
imagesc(f,[0,4096]); colormap(gray);


%image(e);
%imagesc(e,[0,4096]); colormap(gray);
%image(f);
%imagesc(f,[0,255]); colormap(gray);
LucamDisconnect(1);

