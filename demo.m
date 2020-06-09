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
%% Calculate Backscatter
% Plug in Bc_inf, BcB, and z to get Backscatter

Bc = coeff2Bc(Bc_inf,BcB,z);

%% Calculate Direct Signal

Dc = Ic - Bc;

%% Here we assume you know a shape for BcD(z). 
% For example, if it is BcD(z) = a * exp(-b * z) + c * exp(-d * z),
% then you have a,b,c,d, each is an array for 3 color channels. Modify for
% other shapes.

BcD = fitExp2D(a,b,c,d,z);

%% Recovered image at z = 0;

Jc = Dc.*exp(BcD.*z);

%% Photofinishing
% You might still have to white balance the image depending on the scene/depth/geometry.
% Depending on the scene contents, you can use built-in Matlab functions
% like illumwhite, illumgray, or illumpca. Or come up with your own.

% After that, use the Karaimer & Brown ECCV 2016 code to convert your images
% from camera linear RGB space to sRGB. See:
%
% Karaimer, Hakki Can, and Michael S. Brown. 
% A software platform for manipulating the camera imaging pipeline.
% ECCV, pp. 429-444. Springer, Cham, 2016.
%
% Github of the authors:
%
% https://github.com/karaimer/camera-pipeline-dng-sdk
%
% Note that the implementation of this code is very buggy and unstable for underwater images, 
% the choice of which steps to use (after stage 6) will depend on the
% camera. Often times conversion from stage 5-6 blows up colors, and other
% times 6-11 blows up. I still haven't studied this in detail so you'll
% have to adjust manually for each image for the time being.







