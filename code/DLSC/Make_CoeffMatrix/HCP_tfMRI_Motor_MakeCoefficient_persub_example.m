%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       Generate dictionary and coefficient matrix (Nii format data)              %%%%
%%                            subject 10 example
%%                                 JSAver, 2017. 04.10                            %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clear all; clc;

tic
load HCP_tfMRI_2DImg_sub10_170516 % 2D fMRI signal matrix S for subject of interest (# of time samples (N) x # of voxels (V)) 
load HCP_Motor_sub10_JKLuck_MakeD_K400L40Corr01_170516_ITER5 % Dictionary matrix for subject of interest

[TNum, VoxNum] = size(tfMRI_2D_sub10);
tfMRI_2D_sub_norm = zscore(tfMRI_2D_sub10);

int_K = 400; 
int_L = 40; 

mtx_alpha = zeros(int_K, VoxNum);
mtx_alpha = OMP(mtx_D, tfMRI_2D_sub_norm, int_L);
ITERtime=toc
save ('HCP_Motor_sub10_JKLuck_MakeA_K400L40Corr01_170516_ITER5', 'mtx_D', 'mtx_alpha', 'int_K', 'int_L', 'ITERtime', '-v7.3')

