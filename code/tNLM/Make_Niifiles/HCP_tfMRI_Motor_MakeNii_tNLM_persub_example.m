%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Generate dictionary and coefficient matrix (Nii format data)              %%%%
%%                            subject 10 example
%%%                             JSAver, 2017. 05.08                            %%%%
%%% PLOSONE paper tNLM: (D=11, h = 0.72)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% sub10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clear all; clc;
code_dir = 'C:\Users\kangj\Dropbox\cvx\MGH\NIfTI_20140122';
addpath(genpath(code_dir)); % path for codes for Nii files
img_dir_2D = 'C:\1_MGHdata\HCP_NiiFormat_byXiang\Subjects_2DImg';
addpath(genpath(img_dir_2D)); % path for 2D fMRI signal matrix data
tNLM_dir_2D = 'C:\1_MGHdata\HCP_NiiFormat_byXiang\NiiFormat_Motor_tNLM\NiiFormat_Motor_tNLM';
addpath(genpath(tNLM_dir_2D)); % path for tNLM denoised data

XNum = 91; 
YNum = 109;
ZNum = 91; 
TNum = 284;
img_dir_sub = 'C:\1_MGHdata\HCP_NiiFormat_byXiang\10\MOTOR\3T_tfMRI_MOTOR_LR.feat';
% path for mask niifile for subject of interest
mask_nii_sub = load_nii([img_dir_sub filesep 'mask2std.nii']);
mask_4D_sub = mask_nii_sub.img;

load HCP_tfMRI_2DImg_sub10_170516 % 2D fMRI signal matrix S for subject of interest (# of time samples (N) x # of voxels (V)) 
[TNum, VoxNum] = size(tfMRI_2D_sub10);
vS1 = 1;
vF1 = floor(VoxNum/2);
vS2 = vF1 + 1;
vF2 = VoxNum;
load HCP_Motor_sub10_JKLuck_tNLMD11h072spl1_170523
load HCP_Motor_sub10_JKLuck_tNLMD11h072spl2_170523
tNLM_tfMRI = [tNLM_tfMRI_spl1(:,vS1:vF1) tNLM_tfMRI_spl2(:,vS2:vF2)];
D_nii_sub_tNLM = Make_NiiImg_wMatData(mask_4D_sub, tNLM_tfMRI, XNum, YNum, ZNum, TNum);
save_nii(D_nii_sub_tNLM, 'HCP_Motor_sub10_JKLuck_tNLMD11h072_170605.nii');
