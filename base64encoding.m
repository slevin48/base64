%% Base64
% <https://blogs.mathworks.com/pick/2018/02/02/new-mathworks-tools/?s_tid=srchtitle#3 
% https://blogs.mathworks.com/pick/2018/02/02/new-mathworks-tools/?s_tid=srchtitle#3>

x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));
plot(x,y)
%%
print("myPlot.png","-dpng")
% print("myPlot.jpg","-djpg")
%%
import matlab.net.*
I = imread('myPlot.png');
unicodestr = base64encode(I(:));
bytes = unicode2native(unicodestr,'UTF-8')
%%
% pyenv("Version","/usr/bin/python3")
img_file = py.open("myPlot.png","rb");
my_string = py.base64.b64encode(img_file.read());
img_file.close()
%%
base64 = string(my_string.decode('utf-8'))
%%
fileID = fopen('b64.txt','w');
fprintf(fileID,base64);
% fwrite(fileID, bytes, 'uint8');
fclose(fileID);
%%
img = base64decode(base64);
imshow(reshape(img, size(I)))