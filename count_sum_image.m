function s=count_sum_image(I,row,col)
 s=0;
for i = 1: row  
    for j = 1:col      
         s = s + I(i ,j );  
    end     
end    
end