function vocab = build_vocabulary( image_paths, vocab_size )
    feature_array = [];
    binSize = 4;
    magnif = 3;
    desc = [];
    for image = 1:+1:length(image_paths)
        I=imread(image_paths{image});
        Is = vl_imsmooth(single(I), sqrt((binSize/magnif)^2 - .25)) ;
        [~, d] = vl_dsift(Is, 'size', binSize, 'fast', 'step', 5, 'floatdescriptors');
%         size=length(d)/2;
%         feature_array = [feature_array d(:,randsample(size,size))];
         disp( [ 'current image is :' num2str( image)]);
        desc = [desc d];
    end
    [centers,~] = vl_kmeans(desc, vocab_size);
    vocab = centers';
end