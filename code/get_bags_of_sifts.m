% % Bag of sift
% BinSize is use to cluster the image chunk.
% Run the vl_smooth to shrink the descriptor space
% For all images(test and train), calculate the dense SIFT features using an appropriate step size.
% Calculate the distance of all features of the image with the vocabulary obtained.
% Calculate the minimum distance of each feature of image with each image from vocabulary.
% Calculate the histogram of features obtained and normalise it.

function image_feats = get_bags_of_sifts(image_paths)
    load('vocab.mat')
    vocab_size = size(vocab, 1);
    binSize = 4;
    magnif = 3;
    for i = 1:+1:length(image_paths);
       file = image_paths{i};
       img = imread(file);
       Is = vl_imsmooth(single(img), sqrt((binSize/magnif)^2 - .25)) ;
       [~, d] = vl_dsift(Is, 'size', binSize, 'fast', 'step', 5, 'floatdescriptors');
       feats = single(d);
       D = vl_alldist2(feats,vocab');
       [~,I] = min(D');
       for j=1:vocab_size
           h(j) = sum(I == j);          
       end
       h = h/max(h);
       image_feats(i,:) = h;
       image_feats(i,:) = image_feats(i,:) / max(image_feats(i,:));
       disp( [ 'current image is :' num2str( i)]);
    end
end




