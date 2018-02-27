function [ p ] = accuracy( theta1, theta2, num)
    images = load('mnist_all.mat');
    if(num == 1) %for multiclass
        test0 = images.test0();
        test1 = images.test1();
        test2 = images.test2();
        test3 = images.test3();
        test4 = images.test4();
        test5 = images.test5();
        test6 = images.test6();
        test7 = images.test7();
        test8 = images.test8();
        test9 = images.test9();
        test0 = [test0  ones(size(test0,1),1)];
        test1 = [test1  ones(size(test1,1),1)];
        test2 = [test2  ones(size(test2,1),1)];
        test3 = [test3  ones(size(test3,1),1)];
        test4 = [test4  ones(size(test4,1),1)];
        test5 = [test5  ones(size(test5,1),1)];
        test6 = [test6  ones(size(test6,1),1)];
        test7 = [test7  ones(size(test7,1),1)];
        test8 = [test8  ones(size(test8,1),1)];
        test9 = [test9  ones(size(test9,1),1)];
        correctly_classified = 0;
        for j=1:size(test0,1)
            o = compute(test0(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 1
                correctly_classified = correctly_classified+ 1;
            end
        end
        zero_acc = correctly_classified/size(test0,1);
        fprintf('Accuracy for classifying zero = %f\n',correctly_classified/size(test0,1));
        
        correctly_classified = 0;
        for j=1:size(test1,1)
            o = compute(test1(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 2
                correctly_classified = correctly_classified+ 1;
            end
        end
        one_acc = correctly_classified/size(test1,1);
        fprintf('Accuracy for classifying one = %f\n',correctly_classified/size(test1,1));
        correctly_classified = 0;
        for j=1:size(test2,1)
            o = compute(test2(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 3
                correctly_classified = correctly_classified+ 1;
            end
        end
        two_acc = correctly_classified/size(test2,1);
        fprintf('Accuracy for classifying two = %f\n',correctly_classified/size(test2,1));
        correctly_classified = 0;
        for j=1:size(test3,1)
            o = compute(test3(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 4
                correctly_classified = correctly_classified+ 1;
            end
        end
        three_acc = correctly_classified/size(test3,1);
        fprintf('Accuracy for classifying three = %f\n',correctly_classified/size(test3,1));
        correctly_classified = 0;
        for j=1:size(test4,1)
            o = compute(test4(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 5
                correctly_classified = correctly_classified+ 1;
            end
        end
        four_acc = correctly_classified/size(test4,1);
        fprintf('Accuracy for classifying four = %f\n',correctly_classified/size(test4,1));
        correctly_classified = 0;
        for j=1:size(test5,1)
            o = compute(test5(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 6
                correctly_classified = correctly_classified+ 1;
            end
        end
        five_acc = correctly_classified/size(test5,1);
        fprintf('Accuracy for classifying five = %f\n',correctly_classified/size(test5,1));
        correctly_classified = 0;
        for j=1:size(test6,1)
            o = compute(test6(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 7
                correctly_classified = correctly_classified+ 1;
            end
        end
        six_acc = correctly_classified/size(test6,1);
        fprintf('Accuracy for classifying six = %f\n',correctly_classified/size(test6,1));
        correctly_classified = 0;
        for j=1:size(test7,1)
            o = compute(test7(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 8
                correctly_classified = correctly_classified+ 1;
            end
        end
        seven_acc = correctly_classified/size(test7,1);
        fprintf('Accuracy for classifying seven = %f\n',correctly_classified/size(test7,1));
        correctly_classified = 0;
        for j=1:size(test8,1)
            o = compute(test8(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 9
                correctly_classified = correctly_classified+ 1;
            end
        end
        eight_acc = correctly_classified/size(test8,1);
        fprintf('Accuracy for classifying eight = %f\n',correctly_classified/size(test8,1));
        correctly_classified = 0;
        for j=1:size(test9,1)
            o = compute(test9(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 10
                correctly_classified = correctly_classified+ 1;
            end
        end
        nine_acc = correctly_classified/size(test9,1);
        fprintf('Accuracy for classifying nine = %f\n',correctly_classified/size(test9,1));
        p = (zero_acc + one_acc + two_acc +three_acc +four_acc +five_acc +six_acc +seven_acc +eight_acc +nine_acc)/10.0;
        return;
    else % for binary class
        test3 = images.test3();
        test8 = images.test8();
        test3 = [test3 ones(size(test3,1),1)];
        test8 = [test8 ones(size(test8,1),1)];
        correctly_classified = 0;
        for j=1:size(test3,1)
            o = compute1(test3(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 1
                correctly_classified = correctly_classified+ 1;
            end
        end
        three_acc = correctly_classified/size(test3,1);
        fprintf('Accuracy for classifying three = %f\n',correctly_classified/size(test3,1));
        correctly_classified = 0;
        for j=1:size(test8,1)
            o = compute1(test8(j,:),theta1,theta2);
            [~,index] = max(o);
            if index == 2
                correctly_classified = correctly_classified+ 1;
            end
        end
        eight_acc = correctly_classified/size(test8,1);
        fprintf('Accuracy for classifying eight = %f\n',correctly_classified/size(test8,1));
        p = (three_acc + eight_acc)/2.0;
        return;
    end
    
    

end

function [output2] = compute(inputx, theta1, theta2)
    inputx = double(inputx);
    %size(inputx)
    %size(theta1)
    %size(theta2)
    theta1 = double(theta1);
    theta2 = double(theta2);
    x = zeros(100,1);
    output1 = zeros(1,100);
    output2 = zeros(1,10);
    x = theta1*inputx';
    for i = 1:100
        output1(1,i) = 1/(1+exp(-x(i)));
    end
    %disp('calculated output1')
    for k = 1:10
        x = theta2(k,:)*output1';
        output2(1,k) = 1/(1+exp(-x));
    end
    return;
end

function [output2] = compute1(inputx, theta1, theta2)
    inputx = double(inputx);
    %size(inputx)
    %size(theta1)
    %size(theta2)
    theta1 = double(theta1);
    theta2 = double(theta2);
    x = zeros(100,1);
    output1 = zeros(1,100);
    output2 = zeros(1,2);
    x = theta1*inputx';
    for i = 1:100
        output1(1,i) = 1/(1+exp(-x(i)));
    end
    %disp('calculated output1')
    for k = 1:2
        x = theta2(k,:)*output1';
        output2(1,k) = 1/(1+exp(-x));
    end
    return;
end