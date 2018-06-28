clc;
clear;
close all;
%-----------------------------------
%
%-----------------------------------

%[filename, pathname] = uigetfile({'*.jpg'; '*.bmp'; '*.gif'; '*.png' }, '????');
%
% if filename == 0
%     return;
% end

%data = imread([pathname, filename]);
data = imread('Monarch.png');
[m, n, z] = size(data)

%pt = [43, 92];
pt = [37, 89];
wSize = [60,40];

des0 = drawRect(data,pt,wSize,2,[255 0 0] );

pt1 = [194, 205];
des = drawRect(des0,pt1,wSize,2,[0 255 0] );
% subplot(1,2,1)
%     imshow(data)
%subplot1 = subplot(1,3,1)
%subplot(1,2,1)
 %   imshow(des)
  %  hold(subplot1, 'on')
%subplot(2,2,3)
redpart = imcrop(data, [37 89 59 39]);
redpartWithFrame = drawRect(redpart, [1,1],[59,39],1,[255 0 0])
resizedredpart = imresize(redpartWithFrame, 2.1333)
%subplot2 = subplot(1,3,2)
%imshow(redpartWithFrame)
%hold(subplot2, 'on')
greenpart = imcrop(data, [194 205 59 39]);
greenpartWithFrame = drawRect(greenpart, [1,1],[59,39],1,[0 255  0])
resizedgreenpart = imresize(greenpartWithFrame, 2.1333)
%subplot3 = subplot(1,3,3)
%imshow(greenpartWithFrame)
%hold(subplot3, 'on')
lowerpic= cat(2,resizedredpart,resizedgreenpart);
final = cat(1,des,lowerpic );
figure, imshow(final);


return;