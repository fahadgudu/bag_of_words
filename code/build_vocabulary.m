% Starter code prepared by James Hays for CS 143, Brown University

%This function will sample SIFT descriptors from the training images,
%cluster them with kmeans, and then return the cluster centers.

function vocab = build_vocabulary( image_paths, vocab_size )
feature_array = []
for image = 1:+1:length(image_paths)
    I=imread(image_paths{image});
    binSize = 20 ;
    magnif = 3 ;
    Is = vl_imsmooth(single(I), sqrt((binSize/magnif)^2 - .25)) ;
    [~, d] = vl_dsift(Is, 'size', binSize);
    [row,~]=size(d);
    feature_array = [feature_array d(:,randsample(row,50))];
    disp( [ 'current image is :' num2str( image)]);
end
size(feature_array)
[centers,~] = vl_kmeans(single(feature_array), vocab_size);
vocab = transpose(centers);