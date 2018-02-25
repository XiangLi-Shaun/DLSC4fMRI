%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       Generate dictionary and coefficient matrix (Nii format data)              %%%%
%%                            subject 10 example
%%                                 JSAver, 2017. 04.10                            %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clear all; clc;

TaskNum = 6; % cue, LF, LH, RF, RH, T
load HCP_tfMRI_T1_TaskDesign_170309 % six stimuls signals data (# of time samples (N) x # of stimuli (K_f))
load HCP_spmhrf % spm hrf signal data
Stimulus_basis = zeros(TNum, TaskNum);

for tt = 1:TaskNum
    tmp = conv(Stimulus_sig(:,tt), hrf_sig);
     Stimulus_basis(:, tt) = tmp(1:TNum)/norm(tmp(1:TNum));
end

tic
load HCP_tfMRI_2DImg_sub10_170516 % 2D fMRI signal matrix S for subject of interest (# of time samples (N) x # of voxels (V)) 
[TNum, VoxNum] = size(tfMRI_2D_sub10);
tfMRI_2D_sub_norm = zscore(tfMRI_2D_sub10);

corrVar = zeros(VoxNum, TaskNum);
scVar = zeros(VoxNum, TaskNum);
scIdx = zeros(VoxNum, TaskNum);
for tt = 1:TaskNum
    for vv = 1:VoxNum
        corrVar(vv, tt) = corr(Stimulus_basis(:,tt), tfMRI_2D_sub_norm(:,vv));
    end
    [scVar(:,tt), scIdx(:,tt)] = sort(corrVar(:, tt), 'descend');
end
toc

%% makes the submatrix S_r
tfMRI_Tmp = tfMRI_2D_sub_norm; 
Missing_Idx = [];
for tt = 1:TaskNum
    Idx_Tmp = find(scVar(:,tt) > 0.1); % predefined threshold for the learned atoms: C_th = 0.1 
    Missing_Idx = [Missing_Idx scIdx(Idx_Tmp,tt)'];
end
Missing_Idx = sort(Missing_Idx, 'ascend');
tfMRI_Tmp(:,Missing_Idx)=[];

toc

int_K = 400; % # of dictionary basis: K = 400
int_L = 40; % sparsity: lambda = 40
mtx_D_tmp = zeros(TNum, int_K-TaskNum);
[mtx_D_tmp, output] = KSVD_JSA(tfMRI_Tmp, int_L, int_K-TaskNum);
mtx_D = [Stimulus_basis mtx_D_tmp];

ITERtime=toc
save ('HCP_Motor_sub10_JKLuck_MakeD_K400L40Corr01_170516_ITER5', 'mtx_D', 'int_K', 'int_L', 'ITERtime', '-v7.3')



