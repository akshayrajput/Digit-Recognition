function [ toutput2] = test_model(theta1, theta2, test, image)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    images = load('mnist_all');
    test3 = images.test3();
    test8 = images.test8();
    [m,~] = size(test3);
    test3 = [test3 ones(m,1)];
    [m ,~] = size(test8);
    test8 = [test8 ones(m,1)];
    test3 = double(test3)/255.0;
    test8 = double(test8)/255.0;
    toutput1 = zeros(1,100);
    toutput2 = zeros(1,2);
    if test == 3
        tx = theta1*test3(image,:)';
    end
    if test == 8
        tx = theta1*test8(image,:)';
    end
    for i = 1:100
        toutput1(1,i) = 1/(1+exp(-tx(i)));
    end
    for k = 1:2
        tx = theta2(k,:)*toutput1';
        toutput2(1,k) = 1/(1+exp(-tx));
    end
end

