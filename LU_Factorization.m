function [L, U, P] = luFactor(A)
% luFactor(A)

[n, ~] = size(A);

% Initialize L and U
L = eye(n);
U = A;

% Initialize matrix P
P = eye(n);

for k = 1:n-1
    
    % Find the row with the maximum
    [~, i] = max(abs(U(k:n, k)));
    i = i + k - 1;
    
    U([k i], k:n) = U([i k], k:n);
    L([k i], 1:k-1) = L([i k], 1:k-1);
    P([k i], :) = P([i k], :);
    
    % Compute U and L
    for j = k+1:n
        L(j, k) = U(j, k)/U(k, k);
        U(j, k:n) = U(j, k:n) - L(j, k)*U(k, k:n);
    end
end
if P*A==L*A
    error('Please try again')
end
end
