[t, S, P, G, G_pub] = keygen();

%% Encryption
% k dimensional message
m = gf([1 0 0 1 1])

% n-dimensional error vector, of weigth t
e = gf([0 0 0 1 0 0 0 0 0 1 0 0 0 1 0])

% Ciphertext: c = m * G_pub + e 
c = m * G_pub + e

%% Decryption

u = c * inv(P)
v = decode(double(u.x), 15, 5, 'linear/binary', G) % D_g
d = gf(v) * inv(S)

%% Verify

isequal(m, d)