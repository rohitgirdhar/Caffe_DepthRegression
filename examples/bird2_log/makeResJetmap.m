function makeResJetmap()
fname = '3dNormalResult.txt';
out_dir = 'output_jet';
fid = fopen(fname);
line = fgetl(fid);
while ischar(line)
    parts = strsplit(line);
    outfname = parts{1};
    parts = cellfun(@(x) str2num(x), parts(2 : end -1));
    M = reshape(parts', [74 55])';
    M = getjet(M);
    [~, outfname, ~] = fileparts(outfname);
    imwrite(M, fullfile(out_dir, [outfname '.jpg']));
    line = fgets(fid);
end

function M = getjet(M)
M = M ./ max(M(:));
M = imadjust(M);
M = uint8(M .* 255);
jetmap = jet(256);
M = ind2rgb(M, jetmap);

