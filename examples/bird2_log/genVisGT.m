function genVisGT()
gtdir = '/home/shreyansh/bird_workspace/depth_regression/data2/test_data';
depth_outdir = 'gt_jet/';
img_outdir = 'imgs/';
fnames = dir(fullfile(gtdir, '*.txt'));
fnames = arrayfun(@(x) x.name, fnames, 'UniformOutput', false);
for fname = fnames(:)'
    fname = fname{:};
    rows = dlmread(fullfile(gtdir, fname));
    M = rows(4, 1:4070);
    M = reshape(M', [74 55])';
    M = getjet(M);
    imwrite(M, fullfile(depth_outdir, [fname, '.jpg']));
    I = uint8(rows(1:3, :));
    I = permute(reshape(permute(I, [2,1,3]), [304 228 3]), [2,1,3]);
    imwrite(I, fullfile(img_outdir, [fname, '.jpg']));
end

function M = getjet(M)
M = M ./ max(M(:));
M = imadjust(M);
M = uint8(M .* 255);
jetmap = jet(256);
M = ind2rgb(M, jetmap);

