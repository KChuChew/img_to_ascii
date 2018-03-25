% this function converts an rgb or grayscale image to ascii characters
% NNNNNNNNIULOU
% as is now, best input is a binary image, but yolo test for yourself
% inputs: input_image - image to convert as .png file
%         output_file -  file to output ASCII representation to
%
% outputs: output_img - MATLAB matrix with ASCII chars
function output_img = ascii(input_image, output_file)
    % read in and grayscale image
    img = imread(input_image);    
    img = rgb2gray(img);
    %img = rgb2gray(input_image);
    
    % get size of input image, use dimensions to define output mat
    [row col] = size(img);
    output_img = char(row, col);
    
    % iterate through all pixels, assign chars per pixel based
    % on pixel intensty
    for r = 1:row
        for c = 1:col
           if(img(r, c) < 175)
               output_img(r, c) = '!';
           else
               output_img(r, c) = '*';
           end
        end
    end
    % write ASCII chars to file for better viewing
    file = fopen('niulou.txt', 'w+');
    for i = 1:row
        for j = 1:col
            fprintf(file, '%c', output_img(i,j));
        end
        fprintf(file, '\n');
    end
    fclose(file);
end