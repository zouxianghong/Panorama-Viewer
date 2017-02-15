% segment picture into 8 parts
[FileName,PathName] = uigetfile('*.*','Select the image');  
Im=imread([PathName FileName]);
imshow(Im);
hold on
L = size(Im);
max_row = 4;%实验图片为2048*4096
max_col = 8;
height = floor(L(1)/max_row);
width = floor(L(2)/max_col);
seg = cell(max_row,max_col);
%分块
for row = 1:max_row
    for col = 1:max_col
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 
FileName(end-6:end)=[];
for i=1:max_row*max_col
    if(i < 10)
        a = '0';
    else
        a = '';
    end
imwrite(seg{i},strcat(FileName,'_',a,int2str(i),'_r0.jpg'));
end
%画出分块的边界
for row = 1:max_row
    for col = 1:max_col
 rectangle('Position',[width*(col-1),height*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
    end
end
hold off