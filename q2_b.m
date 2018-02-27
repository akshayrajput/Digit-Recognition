clc;clear ; close all;
images = load('mnist_all');
train3 = images.train3();
train8 = images.train8();
[numrow3,numcol3] = size(train3);
[numrow8,numcol8] = size(train8);
inputx = zeros(numrow3+numrow8,numcol3);
inputx = [inputx ones(11982,1)];
y = zeros(numrow3+numrow8,2);
for i = 1:2*numrow8
    if mod(i,2) == 0
        y(i,:) = [0 1];
    else
        y(i,:) = [1 0];
    end
end
for i = 2*numrow8+1:numrow3+numrow8
    y(i,:) = [1 0];
end
j = 1;
if numrow8<numrow3
    k = numrow8;
else
    k = numrow3;
end
for i =1:k
    inputx(j,:) = [train3(i,:) 1];
    inputx(j+1,:) = [train8(i,:) 1];
    j = j+2;
end
for i = numrow8+1:numrow3
    inputx(j,:) = [train3(i,:) 1];
    j = j+1;
end
inputx = double(inputx)/255.0;
clear i;clear j;
% finding x2 for hidden layers
jtheta = 0;
jtheta_new = 0;
theta1 = randn(100,785)/10;
theta2 = randn(2,100)/10;
[m,n] = size(inputx);
output1 = zeros(1,100);
output2 = zeros(1,2);
epsilon = 5;
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
    for k = 1:2
        x = theta2(k,:)*output1';
        output2(1,k) = 1/(1+exp(-x));
    end
    jtheta_new = (1/2)*(y(j,:)-output2)*(y(j,:)-output2)';
    del_k = (-1)*((y(j,:) - output2) .* output2 .* (ones(1,2) - output2));
    theta2 = theta2 - eta*(del_k'*output1);
    del_j = (del_k*theta2).*(output1.*(ones(1,100)-output1));
    theta1 = theta1 - eta*(del_j' * inputx(j,:));
    converged = converged + abs(jtheta_new - jtheta);
    if j == m
        if abs(converged-converged_old) < epsilon
            break
        end
        fprintf(sprintf('%i iterations done\n',iteration/11982));
        fprintf(sprintf('%f diff convergance\n',abs(converged-converged_old)));
        %fprintf(sprintf('%f jtheta\n',jtheta));
        converged_old = converged;
        converged = 0;
    end
    j = mod(j,m) + 1;
    %converge
    %jtheta_new
    
end
accuracy(theta1,theta2, 0);
toc;
