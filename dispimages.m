function [ ] = dispimages( i, number, k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
images = load('mnist_all.mat');
%i = input('1. test image\n2. train image\n');
if i<1 || i>2
    disp('wrong choice');
    return;
end
if i == 1
    %number = input('Enter the number of which image you want to see : ');
    %k = input('Enter the example number : ');
    if number < 0 || number > 9
        disp('wrong choice');
        return;
    end
    if number == 0
        y = images.test0(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 1
        y = images.test1(k,:);
       im = reshape(y,28,28);
        imshow(im');
    end
    if number == 2
        y = images.test2(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 3
        y = images.test3(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 4
        y = images.test4(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 5
        y = images.test5(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 6
        y = images.test6(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 7
        y = images.test7(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 8
        y = images.test8(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 9
        y = images.test9(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end  
end
if i == 2
    %number = input('Enter the number of which image you want to see : ');
    %k = input('Enter the example number : ');
    if number < 0 || number > 9
        disp('wrong choice');
        return;
    end
    if number == 0
        y = train0(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 1
        y = images.train1(k,:);
       im = reshape(y,28,28);
        imshow(im');
    end
    if number == 2
        y = images.train2(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 3
        y = images.train3(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 4
        y = images.train4(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 5
        y = images.train5(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 6
        y = images.train6(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 7
        y = images.train7(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 8
        y = images.train8(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end
    if number == 9
        y = images.train9(k,:);
        im = reshape(y,28,28);
        imshow(im');
    end  
end

end

