clc
%Read Original Image
I=imread('5.png');
%Convert to Binary
B=im2bw(I);
                                                 
%Fill the holes
C=imfill(B,'holes');
                                                    
 %Label the image
[Label,Total]=bwlabel(C,8);
%Object Number
num=4;
[row, col] = find(Label==num);

                                         
                                        
                                   
                               





%To find Bounding Box
sx=min(col)-0.5;
sy=min(row)-0.5;
breadth=max(col)-min(col)+1;
len=max(row)-min(row)+1;
BBox=[sx sy breadth len];
display(BBox);
%Refer:http://angeljohnsy.blogspot.in/2011/06/how-to-draw-in-matlab.html
figure,imshow(I);
hold on;
x=zeros([1 5]);
y=zeros([1 5]);
x(:)=BBox(1);
y(:)=BBox(2);
x(2:3)=BBox(1)+BBox(3);
y(3:4)=BBox(2)+BBox(4);
plot(x,y);

                              

%Find Area
Obj_area=numel(row);
display(Obj_area);
%Find Centroid
X=mean(col);
Y=mean(row);
Centroid=[X Y];
display(Centroid);
plot(X,Y,'ro','color','r');
hold off;
                                  

%Find Perimeter
BW=bwboundaries(Label==num);
c=cell2mat(BW(1));
Perimeter=0;
for i=1:size(c,1)-1
Perimeter=Perimeter+sqrt((c(i,1)-c(i+1,1)).^2+(c(i,2)-c(i+1,2)).^2);
end
display(Perimeter);
                                

%Find Equivdiameter
EquivD=sqrt(4*(Obj_area)/pi);
display(EquivD);


%Find Roundness
Roundness=(4*Obj_area*pi)/Perimeter.^2;
display(Roundness);
                          


%Calculation with 'regionprops'(For verification Purpose);
%Sdata=regionprops(Label,'all');
%Sdata(num).BoundingBox
%Sdata(num).Area
%Sdata(num).Centroid
%Sdata(num).Perimeter
%Sdata(num).EquivDiameter