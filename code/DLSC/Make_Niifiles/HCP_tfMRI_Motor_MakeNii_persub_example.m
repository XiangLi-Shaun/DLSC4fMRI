%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       Generate dictionary and coefficient matrix (Nii format data)              %%%%
%%                            subject 10 example
%%                                 JSAver, 2017. 04.10                            %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    sub10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clear all; clc;

%% Make Nii Img
code_dir = 'C:\Users\kangj\Dropbox\cvx\MGH\NIfTI_20140122'; 
addpath(genpath(code_dir)); % path for codes for Nii files
DA_dir = 'C:\1_MGHdata\HCP_NiiFormat_byXiang\NiiFormat_Motor_IndDic_FixDAndLearnD\Final_fixD_learnD_indDic';
addpath(genpath(DA_dir)); % path for Dictionary and Coefficient matrix data 

img_dir_sub = 'C:\1_MGHdata\HCP_NiiFormat_byXiang\10\MOTOR\3T_tfMRI_MOTOR_LR.feat';
% path for mask niifile for subject of interest
mask_nii_sub = load_nii([img_dir_sub filesep 'mask2std.nii']);
mask_4D_sub = mask_nii_sub.img;
VoxNum_sub = sum(mask_4D_sub(:));

XNum = 91; 
YNum = 109;
ZNum = 91; 
TNum = 284;

load HCP_Motor_sub10_JKLuck_MakeA_K400L40Corr01_170516_ITER5
D_nii_sub_K400L40 = Make_NiiImg(mask_4D_sub, mtx_D, mtx_alpha, XNum, YNum, ZNum, TNum);
save_nii(D_nii_sub_K400L40, 'HCP_Motor_sub10_JKLuck_K400L40Corr01_ITER5.nii');

