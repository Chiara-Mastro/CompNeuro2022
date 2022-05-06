
clear;

Iface1 = imread('profile.jpg');

%we select just the red component of the image
Iface1aux(:,:,1) = Iface1(:,:,1); 
Iface1aux(:,:,2) = Iface1(:,:,1);
Iface1aux(:,:,3) = Iface1(:,:,1);

S = Iface1aux; %black and white
level = 160;
S(S>level) = 256;
S(S<level) = 0;

figure(1);
imagesc(Iface1aux);

figure(2);
imagesc(S);

image = Iface1aux(:,:,1);
save('image.mat', 'image');

clear;
load('image.mat');

[a,b] = size(image);
ratio1 = floor(a/100);
ratio2 = floor(b/100);

%subsampling the image
for i=1:100
   for j=1:100
      image2(i,j) = image(ratio1*i,ratio2*j); 
   end
end

Iface2aux(:,:,1) = image2; 
Iface2aux(:,:,2) = image2;
Iface2aux(:,:,3) = image2;

S = Iface2aux; %black and white
level = 160;
S(S>level) = 255;
S(S<level) = 0;

figure(3);
imagesc(S);

image_c = S; %compressed image
save('image_examen.mat', 'image_c');

