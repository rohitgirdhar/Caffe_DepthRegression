gtdir = '/home/shreyansh/bird_workspace/depth_regression/data2/test_data';
outfile = '/home/rgirdhar/work/01_DepthRegression/caffe/examples/bird2_log/3dNormalResult.txt';
err_dir = '/home/rgirdhar/work/01_DepthRegression/caffe/examples/bird2_log/err_imgs';

fid = fopen(outfile);
line = fgets(fid);
tot_err = 0;
tot_err2 = 0;
count = 0;
while ischar(line)
    line = strsplit(line);
    fname = line{1};
    line = line(2 : end - 1);
    output = cellfun(@(x) str2num(x), line);

    gtmat = dlmread(fullfile(gtdir, fname));
    gt = gtmat(4, 1:4070);
    
    diff = output - gt;
    err = (diff .^ 2);
    err_val = sqrt(sum(err) * (1/4070));
    tot_err = tot_err + err_val;
    err_val2 = mean(abs(diff) ./ gt)
    tot_err2 = tot_err2 + err_val2;
    count = count + 1;
    %[~, fbasename, ~] = fileparts(fname);
    %err = reshape(err', [74 55])';
    %imwrite(imadjust(err), fullfile(err_dir, [fbasename '.jpg']));


    line = fgets(fid);
end
count
tot_err = tot_err / count;
tot_err2 = tot_err2 / count;
fprintf('%f %f\n', tot_err, tot_err2);

