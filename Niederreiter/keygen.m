function [t, S, P, H, H_pub] = keygen()

% pre-defined
n = 15
k = 5
t = 3 


% Permutation Matrix, of size n x n
R = randperm(15)
I = eye(15)
P = gf(I(:, R))

% Non-singular matrix, of size k x k
tmp = [ 1 1 0 0 0 0 1 1 0 1
        0 0 0 0 0 1 1 1 1 1
        0 0 0 1 1 1 0 0 0 0
        0 0 1 0 1 1 0 1 0 1
        0 1 1 1 0 1 1 1 1 0
        1 1 1 1 1 0 0 1 0 1
        1 0 0 1 1 0 1 0 1 0
        0 0 1 1 0 0 0 0 0 0
        0 0 1 1 1 1 0 1 0 0
        0 0 1 1 1 1 0 1 1 0]
S = gf(tmp)

% Parity-check matrix, of size (n-k) x n
H = [1 0 0 0 0 0 0 0 0 0 1 1 0 1 0
    0 1 0 0 0 0 0 0 0 0 0 1 1 0 1
    0 0 1 0 0 0 0 0 0 0 1 1 1 0 0
    0 0 0 1 0 0 0 0 0 0 0 1 1 1 0
    0 0 0 0 1 0 0 0 0 0 0 0 1 1 1
    0 0 0 0 0 1 0 0 0 0 1 1 0 0 1
    0 0 0 0 0 0 1 0 0 0 1 0 1 1 0
    0 0 0 0 0 0 0 1 0 0 0 1 0 1 1
    0 0 0 0 0 0 0 0 1 0 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 1 1 0 1 0 1]

% Final formula
H_pub = S * gf(H) * P

% Public key (H_pub, t)
% Private key (S_i, H, R_i)

end