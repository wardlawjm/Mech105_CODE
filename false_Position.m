% falsePosition - Find the root of a function using false position method
function [root, fx, ea, iter] = false_Position(func, xl, xu, es, maxit, varargin)

if nargin<3
    error('more inputs needed, need func,xl,xu')
end

if nargin<4
    maxit=200;
    es=0.0001;
end

if nargin<5
    maxit=200;
end

iter=0;
ea=100;
rootold=100;

% func: the function to find the root of
% xl: the lower bound of the interval to search for the root
% xu: the upper bound of the interval to search for the root

while ea>es && iter<maxit
    fxl= func(xl);
    fxu=func(xu);
    iter=iter+1;
    root= xu - ((fxu*(xl-xu))/(fxl-fxu));
    fx= func(root);
    if fx==0;
        ea=0;
        
    end

    % fx: the function value at the root

    if fx<0 &&fxl<0;
        xl=root;
    else
        xu = root;
    end
    
    if iter>=1 && fx~=0;
        ea= (abs(rootold-root)/root)*100;
    end
    rootold=root;
end


end

% Example usage:
%   To find the root of the function f(x) = x^3 + 4*x^2 - 10 on the interval
%   [1, 2] with a desired relative error of 0.001: