function [t, S, P, G, G_pub] = keygen()

% pre-defined
n = 15
k = 5
t = 3 


% Permutation Matrix, of size n x n
R = randperm(15)
I = eye(15)
P = gf(I(:, R))

% Non-singular matrix, of size k x k
tmp = [ 0 1 0 0 1
        1 1 1 0 1
        0 0 1 1 0
        0 0 1 0 0
        0 1 1 1 0]
S = gf(tmp)

% Generator matrix, of size k x n
G = [1 0 1 0 0 1 1 0 1 1 1 0 0 0 0
    1 1 1 1 0 1 0 1 1 0 0 1 0 0 0
    0 1 1 1 1 0 1 0 1 1 0 0 1 0 0
    1 0 0 1 1 0 1 1 1 0 0 0 0 1 0
    0 1 0 0 1 1 0 1 1 1 0 0 0 0 1]

% Final formula
G_pub = S * gf(G) * P

% Public key (G_pub, t)
% Private key (S_i, G, R_i)

end