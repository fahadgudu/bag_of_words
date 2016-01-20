% % Build Voculabory
% We build clusters (equal to the vocabulary size) for the sift features and assign a visual word to each of these clusters.
function vocab = build_vocabulary( image_paths, vocab_size )
    binSize = 4;
    magnif = 3;
    desc = [];
    for image = 1:+1:length(image_paths)
        I=imread(image_paths{image});
        Is = vl_imsmooth(single(I), sqrt((binSize/magnif)^2 - .25)) ;
        [~, d] = vl_dsift(Is, 'size', binSize, 'fast', 'step', 5, 'floatdescriptors');
        disp( [ 'current image is :' num2str( image)]);
        desc = [desc d];
    end
    %Cluster the Features into vocab_size number of clusters
    [centers,~] = vl_kmeans(desc, vocab_size);
    vocab = centers';
end