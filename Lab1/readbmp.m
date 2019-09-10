function RGB = readbmp(filename)
    fid=fopen(filename ,'r');
    bfType = fread(fid,1,'int16');
    bfSize = fread(fid,1,'int32');
    bfReserved1 = fread(fid,1,'int16');
    bfReserved2 = fread(fid,1,'int16');
    bfOffBits = fread(fid,1,'int32');
    biSize = fread(fid,1,'int32');
    biWidth = fread(fid,1,'int32');
    biHeight = fread(fid,1,'int32');
    biPlanes = fread(fid,1,'int16');
    biBitCount = fread(fid,1,'int16');
    biCompression = fread(fid,1,'int32');
    biSizeImages = fread(fid,1,'int32');
    biXPelsPerMeter = fread(fid,1,'int32');
    biYPelsPerMeter = fread(fid,1,'int32');
    biClrUsed = fread(fid,1,'int32');
    biClrImportant = fread(fid,1,'int32');
    colorPalette = fread(fid,bfOffBits-54,'int8');
    W=4*int32(biBitCount*biWidth/32);
    i_start = 0;
    i_end = 0;
    plus = 0;
    if biHeight<0
        biHeight = -biHeight;
        i_start = biHeight;
        i_end = 1;
        plus = -1;
    else
        i_start = 1;
        i_end = biHeight;
        plus = 1;
    end
    RGB = im2uint8(zeros(biHeight,biWidth,3));
    for i=i_start:plus:i_end
        for j=1:biWidth
            if biBitCount==16
                temp = fread(fid,1,'uint16');
                B=0;G=0;R =0;
                for k=1:5
                    B = B + bitget(temp,k*3)*(2^k);
                    G = G + bitget(temp,k*2)*(2^k);
                    R = R + bitget(temp,k)*(2^k);
                end
            elseif biBitCount==24
                B = fread(fid,1,'uint8');
                G = fread(fid,1,'uint8');
                R = fread(fid,1,'uint8');
            elseif biBitCount==32
                B = fread(fid,1,'uint8');
                G = fread(fid,1,'uint8');
                R = fread(fid,1,'uint8');
                A = fread(fid,1,'uint8');
            end
            RGB(biHeight-i+1,j,1)=R;
            RGB(biHeight-i+1,j,2)=G;
            RGB(biHeight-i+1,j,3)=B;
        end
        for j=1:W-biBitCount/8*biWidth
            fread(fid,1);
        end
    end
end