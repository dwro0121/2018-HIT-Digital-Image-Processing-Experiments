function trans(filename)
    img = readbmp(strcat(filename,'.bmp'));
    subplot(5,4,1),imshow(img,'InitialMagnification','fit');title('Original'); 
    subplot(5,4,2),imshow(img(:,:,1),'InitialMagnification','fit');title('R'); 
    subplot(5,4,3),imshow(img(:,:,2),'InitialMagnification','fit');title('G'); 
    subplot(5,4,4),imshow(img(:,:,3),'InitialMagnification','fit');title('B'); 
    img_yiq = RGB2YIQ(img);
    img_hsi = RGB2HSI(img);
    img_ycbcr = RGB2YCbCr(img);
    img_xyz = RGB2XYZ(img);
    imwrite(img_yiq,strcat(filename,'-L160301001-YIQ.bmp'));
    subplot(5,4,5),imshow(img_yiq,'InitialMagnification','fit');title('YIQ'); 
    imwrite(img_hsi,strcat(filename,'-L160301001-HSI.bmp'));
    subplot(5,4,9),imshow(img_hsi,'InitialMagnification','fit');title('HSI'); 
    imwrite(img_ycbcr,strcat(filename,'-L160301001-YCbCr.bmp'));
    subplot(5,4,13),imshow(img_ycbcr,'InitialMagnification','fit');title('YCbCr'); 
    imwrite(img_xyz,strcat(filename,'-L160301001-XYZ.bmp'));
    subplot(5,4,17),imshow(img_xyz,'InitialMagnification','fit');title('XYZ'); 
end