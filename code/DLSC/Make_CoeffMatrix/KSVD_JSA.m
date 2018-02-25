function [mtx_D,output] = KSVD_JSA( tfMRI, int_L, int_K)

param.L = int_L; % number of nonzero components: sparsity
param.K = int_K; % number of basis
param.numIteration = 5; % number of iteration to execute the K-SVD algorithm.
param.errorFlag = 0; % decompose signals until a certain error is reached. do not use fix number of coefficients.
param.preserveDCAtom = 0;
param.InitializationMethod =  'DataElements';
param.displayProgress = 1;

disp('Starting to  train the dictionary');
[mtx_D,output]  = KSVD(tfMRI,param);
disp('Done to train the dictionary');