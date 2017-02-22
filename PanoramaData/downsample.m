%downsample pic
[FileName,PathName] = uigetfile('*.*','Select the image');  
Im=imread([PathName FileName]);
DSimg=Im(1:4:end,1:4:end,:);
FileName(end-3:end)=[];
imwrite(DSimg,strcat(FileName,'_DS','.jpg'));