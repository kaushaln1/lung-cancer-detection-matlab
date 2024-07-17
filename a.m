originalI = imread('cameraman.tif');
se = offsetstrel('ball',5,5);
dilatedI = imdilate(originalI,se);
imshow(dilatedI)