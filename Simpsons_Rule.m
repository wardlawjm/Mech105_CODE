function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
if ~isvector(x) || ~isvector(y) || numel(x) ~= numel(y)
    error('Inputs x and y must be equal-length vectors.')
end

dx = diff(x);
if max(abs(dx - dx(1))) > 1e-12 
    error('x must be equally spaced.')
end

if mod(numel(x),2) == 0 
    warning('Trapezoidal rule last interval.')
    h = dx(end-1);
    I = (h/3) * (y(1) + 4*sum(y(2:2:end-2)) + 2*sum(y(3:2:end-2)) + y(end-1)) ...
        + (h/2) * (y(end-1) + y(end));
else 
    h = dx(1);
    I = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
end