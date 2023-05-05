% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;
x = linspace(-pi/2,pi/2);

% Define the function to be solved for. Is the angle specified in radians or degrees?
func = @(x) ((mu*m*g)./(cos(x) + (mu*sin(x))))- F;

% THINK, what makes range sense for angle?

% Plot your function. Does plotting give you an idea about where the root is?
plot(x,func(x),'c');

% Finaly solve for the root using the bisection script given to you, which can be called as:
[root, fx, ea, iter] = bisect(func, 0, pi/2);

% These variables will be checked for your final answer:
angle = rad2deg(root);
format long
fprintf('root %f', angle);