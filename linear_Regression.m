function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set

if length(x)~=length(y)
    error('Make sure x and y are same size')
end
%sorting x and y
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
y = sortedY
x = sortedX

% Outliets
n = length(x);
Q1= floor((n+1)/4);
Q3= floor((3*n+3)/4);
IQR=Q3-Q1;

threshold = 1.5*IQR;
outliers = y < (Q1 - threshold) | y > (Q3 + threshold);
fY = y(~outliers)
fX = x(~outliers)

% Linear Regression
n_new=length(y);
y_avg=mean(fY);
x_avg=mean(fX);
SSx=sum((fX-x_avg).^2);
SP=sum((fX-x_avg).*(fY-y_avg));
slope = SP/SSx

intercept = y_avg-slope.*x_avg

line = slope.*fX+intercept
%Rsquared
SStot=sum((fY-y_avg).^2);
SSres=sum((fY-line).^2);
Rsquared=1-(SSres/SStot)

end