clc;clear all; close all;
images = load('mnist_all.mat');
i = input('1. test image\n2. train image\n');
number = input('Enter the number of which image you want to see : ');
k = input('Enter the example number : ');
dispimages(i, number,k);