function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)

f_size = length(dir(focal_stack_dir));

for i = 1:(f_size-3)
    img = imread(fullfile(focal_stack_dir,['frame', num2str(i), '.jpg']));
    rgb_stack(:,:,3*i-2) = img(:,:,1);
    rgb_stack(:,:,3*i-1) = img(:,:,2);
    rgb_stack(:,:,3*i) = img(:,:,3);
    
    gray_stack(:,:,i) = im2bw(rgb_stack(:,:,(3*i-2):(3*i)));
end