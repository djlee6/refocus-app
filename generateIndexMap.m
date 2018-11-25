function index_map = generateIndexMap(gray_stack, w_size)

stack_imgs = length(gray_stack(1,1,:));
rows = length(gray_stack(:,1,1));
cols = length(gray_stack(1,:,1));

focus_measure(:,:,1:stack_imgs) = focusMeasure(gray_stack(:,:,1:stack_imgs), w_size);

%each pixel in index map has a value corresponding to the image where that
%pixel is best in focus
%search each pixel individually for each image finding the maximum out of
%image set

index_map = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        [col_max, row_num] = max(focus_measure(i,j,:));
        
        index_map(i,j) = row_num;
    end
end

window = fspecial('average',3);
index_map = imfilter(index_map(:,:), window,'replicate', 'conv');