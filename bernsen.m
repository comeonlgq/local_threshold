function b = bernsen( I )
%利用bernsen计算局部阈值

w=13; %矩阵大小为2*w+1
T=0;%阈值大小
max=0;
min=0;
% if row<w+1||col<w+1 
%     return
% end
% 
% [m,n]=size(I);
% if row>m-w||col>n-w
%     return
% end   

[m,n]=size(I);

%根据bernsen算法计算每个像素点的阈值
T=zeros(m-2*w,n-2*w);

%根据bernsen算法计算每个像素点的阈值
for i = (w + 1):(m - w)  
    for j = (w + 1):(n - w)  
        max = uint8(I(i,j));  
        min = uint8(I(i,j));  
        for k = -w:w  
            for l = -w:w  
                if max < uint8(I(i + k,j + l))  
                    max = uint8(I(i + k,j + l));  
                end  
                if min > uint8(I(i + k,j + l))  
                    min = uint8(I(i + k,j + l));  
                end  
            end  
        end  
        T(i,j) = 0.5*(max + min);  
    end  
end  
for i = (w + 1):(m - w)  
    for j = (w + 1):(n - w)  
        if I(i,j) > T(i,j)  
            I(i,j) = uint8(255);  
        else  
            I(i,j) = uint8(0);  
        end  
    end  
end  
end

