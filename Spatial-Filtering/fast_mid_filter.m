function img_mid=fast_mid_filter(img)
    R = fast_mid(img(:,:,1));
    G = fast_mid(img(:,:,2));
    B = fast_mid(img(:,:,3));
    img_mid = uint8(cat(3,R,G,B));
end