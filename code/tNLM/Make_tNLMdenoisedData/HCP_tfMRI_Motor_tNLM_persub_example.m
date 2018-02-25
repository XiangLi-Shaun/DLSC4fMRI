%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Generate dictionary and coefficient matrix (Nii format data)              %%%%
%%                            subject 10 example
%%%                             JSAver, 2017. 05.08                            %%%%
%%% PLOSONE paper tNLM: (D=11, h = 0.72)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clear all; clc;

tic
load HCP_tfMRI_2DImg_sub10_170516 % 2D fMRI signal matrix S for subject of interest (# of time samples (N) x # of voxels (V)) 
D = 11;
h = 0.72;
[TNum, VoxNum] = size(tfMRI_2D_sub10);
vS1 = 1;
vF1 = floor(VoxNum/2);
vS2 = vF1 + 1;
vF2 = VoxNum;

tNLM_tfMRI_spl1 = tNLM_Dnoise_2DImg_split(tfMRI_2D_sub10, vS1, vF1, D, h);
ITERtime=toc
save ('HCP_Motor_sub10_JKLuck_tNLMD11h072spl1_170523', 'tNLM_tfMRI_spl1', 'ITERtime', '-v7.3')

tNLM_tfMRI_spl2 = tNLM_Dnoise_2DImg_split(tfMRI_2D_sub10, vS2, vF2, D, h);
ITERtime=toc
save ('HCP_Motor_sub10_JKLuck_tNLMD11h072spl2_170523', 'tNLM_tfMRI_spl2', 'ITERtime', '-v7.3')



