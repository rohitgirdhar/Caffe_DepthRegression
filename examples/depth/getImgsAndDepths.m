% as per how caffe wants it
load('nyu_depth_v2_labeled.mat', 'images', 'depths');
IMG_OUT_DIR = 'data/'; mkdir (IMG_OUT_DIR);
nImgs = size(images, 4);
for i = 1 : nImgs
    im = imresize(images(:, :, :, i), [228 304]);
    fname = fullfile(IMG_OUT_DIR, [num2str(i) '.txt']);
    for ch = 1 : 3
        I = reshape(im(:, :, ch)', 1, []);
        dlmwrite(fname, uint32(I), '-append');
    end
    dp = imresize(depths(:, :, i), [55 74]);
    D = reshape(dp', 1, []);
    dlmwrite(fname, D, '-append');
end

