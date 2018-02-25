clear; clear all; clc; 

code_dir = 'C:\Users\Seongah Jeong\Dropbox\cvx\MGH\NIfTI_20140122';
img_dir = 'C:\Users\Seongah Jeong\Documents\ALDrive\Download\Quanzheng_TauPIBVol\Quanzheng_TauPIBVol';
addpath(genpath(code_dir));
addpath(genpath(img_dir));

TempImg = load_nii('Scrub_WMVentonly_ffBPS_motRes_ss_nn_st_dv_130627_4TT01505_TAU058_6mm.nii');
view_nii(TempImg);

% temp=zeros(120,1);
% for tt=1:1:120
%     temp(tt)=TempImg.img(15,10,15,tt);
% end
% 
% Time=1:1:120;
% plot(Time, temp);
% size(img_1.img)
% figure(); imshow(img_1.img(:,:,1));colormap jet
% figure(); imagesc(img_1.img(:,:,1));colormap jet