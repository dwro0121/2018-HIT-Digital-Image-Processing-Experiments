img = imread('3.jpg');
imgf = filt(img,10,5,0.3);
img1 = edge(imgf,'sobel');
imga = avg_filter(imgf,img1);
img = imga+30; 
imwrite(img,'result.jpg');