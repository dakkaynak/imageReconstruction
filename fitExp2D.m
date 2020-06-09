function BcD = fitExp2D(a,b,c,d,z)
% Coefficients are for all 3 color channels
% eg, a_c means a_c = [a_R a_G a_B]

exp2 = @(a_c,b_c,c_c,d_c,z) a_c.*exp(-b_c.*z) + c_c.*exp(-d_c.*z);

s = size(z);
BcD = zeros(s(1)*s(2),3);
z = reshape(z,[s(1)*s(2),1]);
for i = 1:3
    BcD(:,i) = exp2(a(i),b(i),c(i),d(i),z);
end
% Attenuation coefficient "image", or pixelwise attenuation coefficient
BcD = reshape(BcD,[s(1) s(2) 3]);

