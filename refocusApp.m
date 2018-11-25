function refocusApp(rgb_stack, depth_map)

figure('Name','Refocus App','NumberTitle','off');
imshow(rgb_stack(:,:,1:3));
%[x,y] = ginput(1);

%row = round(x);
%col = round(y);
%img_num = depth_map(row,col);
%disp(img_num);

%imshow(rgb_stack(:,:,((3*img_num)-2):3*img_num));

x = 1;
y = 1;

while (x > 0 && x <= size(rgb_stack,2) && y > 0 && y<= size(rgb_stack,1))
   [x,y] = ginput(1);
   
   if(x < 0 || x >= size(rgb_stack,2) || y < 0 || y >= size(rgb_stack,1))
       break;
   end
   
   col = round(x);
   row = round(y);
   img_num = depth_map(row,col);

   imshow(rgb_stack(:,:,((3*img_num)-2):3*img_num)); 
end
close 'Refocus App';