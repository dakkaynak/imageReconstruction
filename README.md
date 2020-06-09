
% How to reconstruct the lost colors in an underwater image according to
% the Akkaynak-Treibitz image formation model, given backscatter and 
% attenuation coefficients

% For details see:
%
% Sea-thru: A Method For Removing Water From Underwater Imags
% Derya Akkaynak & Tali Treibitz
% IEEE CVPR 2019
%
% and also:
%
% A Revised Underwater Image Formation Model
% Derya Akkaynak & Tali Treibitz
% IEEE CVPR 2018
%
% For questions, email: derya.akkaynak@gmail.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General form of Image Formation
%
% Ic = Dc + Bc
%
% Ic: image with attenuated colors
% Dc: direct signal
% Bc: backscattered signal
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Akkaynak-Treibitz Image Formation Model:
% 
% Ic = Jc . * exp(-BcD(z).* z) + Bc_inf * (1 - exp(-BcB * z));
%
% BcD(z): range-dependent attenuation coefficient.
% BcB : backscatter coefficient
% z: range, same size as Ic
% Jc: image we would like to recover.
%
% Jc = Dc.*exp(BcD(z).* z);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
