clc;clear;close all;
images = load('mnist_all');
train0 = images.train0();
train1 = images.train1();
train2 = images.train2();
train3 = images.train3();
train4 = images.train4();
train5 = images.train5();
train6 = images.train6();
train7 = images.train7();
train8 = images.train8();
train9 = images.train9();
minx = 5421;
inputx = zeros(10*minx,784);
j = 1; 
for i = 1:minx
inputx(j,:)   = train0(i,:);
inputx(j+1,:) = train1(i,:);
inputx(j+2,:) = train2(i,:);
inputx(j+3,:) = train3(i,:);
inputx(j+4,:) = train4(i,:);
inputx(j+5,:) = train5(i,:);
inputx(j+6,:) = train6(i,:);
inputx(j+7,:) = train7(i,:);
inputx(j+8,:) = train8(i,:);
inputx(j+9,:) = train9(i,:);
j = j+10;
end
inputx = [inputx ones(10*minx,1)];

y = zeros(minx*10,10);
j = 1;
for i = 1:minx
    y(j,:)   = [1 0 0 0 0 0 0 0 0 0];
    y(j+1,:) = [0 1 0 0 0 0 0 0 0 0];
    y(j+2,:) = [0 0 1 0 0 0 0 0 0 0];
    y(j+3,:) = [0 0 0 1 0 0 0 0 0 0];
    y(j+4,:) = [0 0 0 0 1 0 0 0 0 0];
    y(j+5,:) = [0 0 0 0 0 1 0 0 0 0];
    y(j+6,:) = [0 0 0 0 0 0 1 0 0 0];
    y(j+7,:) = [0 0 0 0 0 0 0 1 0 0];
    y(j+8,:) = [0 0 0 0 0 0 0 0 1 0];
    y(j+9,:) = [0 0 0 0 0 0 0 0 0 1];
    j = j+10;
end

inputx = double(inputx)/255.0;
clear i;clear j;
% finding x2 for hidden layers
jtheta = 0;
jtheta_new = 0;
theta1 = randn(100,785)/10;
theta2 = randn(10,100)/10;
[m,n] = size(inputx);
output1 = zeros(1,100);
output2 = zeros(1,10);
epsilon = 30;
converged = 0;
converged_old = 0;
iteration = 0;
j = 1;
tic;
while(1)
    iteration = iteration + 1;
    eta = (1/sqrt(iteration));
    %if mod(iteration,1000) == 0
    %    fprintf(sprintf('%i iterations done\n',iteration));
    %    fprintf(sprintf('%f convergance\n',converged));
    %    fprintf(sprintf('%f jtheta\n',jtheta));
    %end
    jtheta = jtheta_new;
    x = theta1*inputx(j,:)';
    %disp('calculated x')
    for i = 1:100
        output1(1,i) = 1/(1+exp(-x(i)));
    end
    %disp('calculated output1')
    for k = 1:10
        x = theta2(k,:)*output1';
        output2(1,k) = 1/(1+exp(-x));
    end
    jtheta_new = (1/2)*(y(j,:)-output2)*(y(j,:)-output2)';
    del_k = (-1)*((y(j,:) - output2) .* output2 .* (ones(1,10) - output2));
    theta2 = theta2 - eta*(del_k'*output1);
    del_j = (del_k*theta2).*(output1.*(ones(1,100)-output1));
    theta1 = theta1 - eta*(del_j' * inputx(j,:));
    converged = converged + abs(jtheta_new - jtheta);
    if j == m
        if abs(converged-converged_old) < epsilon
            break
        end
        fprintf(sprintf('%i iterations done\n',iteration/(10*minx)));
        fprintf(sprintf('%f diff convergance\n',abs(converged-converged_old)));
        %fprintf(sprintf('%f jtheta\n',jtheta));
        converged_old = converged;
        converged = 0;
    end
    j = mod(j,m) + 1; 
end
accuracy(theta1, theta2, 1);
toc;