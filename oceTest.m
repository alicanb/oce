%Tests in An evaluation metric for image segmentation of multiple objects

gt =[0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0];
im1=[0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0];
im2=[0 0 0 0; 0 1 1 0; 0 2 2 0; 0 0 0 0];
im3=[0 0 0 0; 0 1 1 0; 0 2 3 0; 0 0 0 0];
im4=zeros(4);

%% Test 1: Perfect match
assert(oce(gt,im1)==0,'should be 0');

%% Test 2: Terrible match
assert(oce(gt,im4)==1,'should be 1');

%% Test 3: Example 1
assert(oce(gt,im2)==0.5,'should be 0.5');

%% Test 4: Example 2
assert(oce(gt,im3)==0.625,'should be 0.625');