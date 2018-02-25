function d_nii = Make_NiiImg(mask_4D, mtx_D, mtx_alpha, XNum, YNum, ZNum, TNum)

d_tfMRI_2D = mtx_D * mtx_alpha;
d_tfMRI_4D = zeros(XNum, YNum, ZNum, TNum);
d_tfMRI_4D = tool_image2D2image4DwithMask(d_tfMRI_2D, mask_4D);

voxel_size = [2 2 2]; 
origin = [46 64 37]; 
d_nii = make_nii(d_tfMRI_4D, voxel_size, origin, []); 
d_nii.hdr.dime.dim=[4, 91, 109, 91, 284, 1, 1, 1];
d_nii.hdr.dime.datatype=16;
d_nii.hdr.dime.bitpix=32;
d_nii.hdr.dime.pixdim=[1, 2, 2, 2, 1, 0, 0, 0];
d_nii.hdr.dime.vox_offset=352;
d_nii.hdr.dime.scl_slope=1;
d_nii.hdr.dime.xyzt_units=10;

end