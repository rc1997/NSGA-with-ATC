clc;
clear;
r=fopen('solutionall.txt','rt');
result=fscanf(r,'%f');
result2 = (reshape(result, [6,length(result)/6]))';
fclose(r);
clear result