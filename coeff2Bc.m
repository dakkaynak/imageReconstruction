function Bc = coeff2Bc(Bc_inf,BcB,z)

% Bc = Bc_inf * (1- exp(-BcB * z));

% Size of range map/image
s = size(z);

% Has the user passed one color channel or all three?
numChannels = numel(Bc_inf);
Bc = zeros(s(1),s(2),numChannels);

for i = 1:numChannels
    Bc(:,:,i) = Bc_inf(i).*(1-exp(-BcB(i).*z));
end
