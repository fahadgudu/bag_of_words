load('vocab.mat')
vocab_size = size(vocab, 2);
binSize = 70;
magnif = 3;   
for i = 1:+1:length(image_paths);
   file = image_paths{i};
   img = imread(file);
   Is = vl_imsmooth(single(img), sqrt((binSize/magnif)^2 - .25)) ;
   [~, d] = vl_dsift(Is, 'size', binSize, 'fast');
   feats = transpose(single(d));
   D = pdist2(feats,vocab);
   [~,I] = min(D);
   image_feats(i,:) = hist(I, 1:vocab_size);
   image_feats(i,:) = image_feats(i,:) / max(image_feats(i,:));
   disp( [ 'current image is :' num2str( i)]);
end

