camera = 1;
LucamCameraOpen(camera);
LucamInitAutoLens(true,camera);
iris = LucamGetProperty(21, camera);
iris.Value = 10;
LucamSetProperty(iris, camera);  %open iris.
LucamCameraClose(camera);    