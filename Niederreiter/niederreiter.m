[t, S, P, H, H_pub] = keygen();

%% Encryption
% n dimensional message, of weigth t
m_e = gf([0 0 1 0 0 0 0 1 0 0 0 1 0 0 0])

% Ciphertext: c = m_e * transpose(H_pub)
c = m_e * H_pub.'

%% Decryption

u = c * (inv(S).') % u = e*P.'*H.'
T = syndtable(H) % SD_G
i = bi2de(double(u.x), 'left-msb') % SD_G
v = T(i + 1, :) % SD_G ( = e*P.' )
d = gf(v) * (inv(P).')

%% Verify

isequal(m_e, d)