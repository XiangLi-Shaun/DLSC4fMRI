function tNLM_tfMRI = tNLM_Dnoise_2DImg_split(tfMRI_2D_sub, vS, vF, D, h)

[TNum, VoxNum] = size(tfMRI_2D_sub);
tfMRI_2D_sub_norm = zscore(tfMRI_2D_sub);

tNLM_tfMRI = zeros(TNum, VoxNum);

for vv=vS:vF
    Ns = [];
    tot_weight = 0;
    
    for pp=1:VoxNum
        weight = 0;
        if norm( tfMRI_2D_sub_norm(:,vv) - tfMRI_2D_sub_norm(:,pp) ) <= D %Define the neighborhood set: N(s)
            Ns = [Ns pp]; 
            weight = exp( -norm( tfMRI_2D_sub_norm(:,vv) - tfMRI_2D_sub_norm(:,pp) )^2 ...
                / ( TNum * h^2 ) );
            tNLM_tfMRI(:,vv) = tNLM_tfMRI(:,vv) + tfMRI_2D_sub_norm(:,pp) * weight;
            tot_weight = tot_weight + weight;
        end
    end
    
   tNLM_tfMRI(:,vv) = tNLM_tfMRI(:,vv)/tot_weight;
end

end