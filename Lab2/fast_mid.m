function img_f=fast_mid(img)
    [row,col]=size(img);
    th=5;
    img_f=zeros(row,col);
    img_temp=zeros(row+2,col+2);
    for i=0:row+1
        if i<1
            row_temp=1;
        elseif i>row
            row_temp=row;
        else
            row_temp=i;
        end
        for j=0:col+1
            if j<1
                col_temp=1;
            elseif j>col
                col_temp=col;
            else
                col_temp=j;
            end
            img_temp(i+1,j+1)=img(row_temp,col_temp);
        end
    end
    for row_temp=1:row
        hist=zeros(1,256);
        num=0;
        for i=row_temp:row_temp+2
            for j=1:3
                hist(img_temp(i,j)+1)=hist(img_temp(i,j)+1)+1;
            end
        end
        for i=0:255
            num=hist(i+1)+num;
            if num>th
                index=i;
                break;
            end
        end
        img_f(row_temp,1)=index;  
        for col_temp=2:col
            for i=row_temp:row_temp+2
                hist(img_temp(i,col_temp-1)+1)=hist(img_temp(i,col_temp-1)+1)-1;
                hist(img_temp(i,col_temp+2)+1)=hist(img_temp(i,col_temp+2)+1)+1;
                if img_temp(i,col_temp-1)<=index
                    num=num-1;
                end
                if img_temp(i,col_temp+2)<=index
                    num=num+1;
                end
            end
            while num>th
                num=num-hist(index+1);
                index=index-1;
            end
            while num<=th
                index=index+1;
                num=num+hist(index+1);
            end
            img_f(row_temp,col_temp)=index;
        end
    end
end