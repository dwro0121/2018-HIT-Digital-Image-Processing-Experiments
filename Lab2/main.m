img = imread('2.jpg');
% imshow(Change_Brightness(img,2)); %调整亮度
% imshow(Change_Hue(img,2));    %调整色度
% imshow(Change_Chroma(img,1.5c));  %调整饱和度
% imshow(Change_Contrast(img,2));   %调整对比度
% bar(Histogram(img));  %统计直方图
% img = imnoise(img,'salt & pepper',0.02);
% imshow(avg_filter(img));  %处理平均滤波
% imshow(mid_filter(img));  %处理中值滤波
% imshow(edge(img,'roberts'));  %roberts算子边缘检测
% imshow(edge(img,'sobel'));    %sobel算子边缘检测
% imshow(fast_mid_filter(img)); %处理快速中值滤波