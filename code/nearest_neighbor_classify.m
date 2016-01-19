% Starter code prepared by James Hays for CS 143, Brown University

%This function will predict the category for every test image by finding
%the training image with most similar features. Instead of 1 nearest
%neighbor, you can vote based on k nearest neighbors which will increase
%performance (although you need to pick a reasonable value for k).

function predicted_categories = nearest_neighbor_classify(train_image_feats, train_labels, test_image_feats)
% image_feats is an N x d matrix, where d is the dimensionality of the
%  feature representation.
% train_labels is an N x 1 cell array, where each entry is a string
%  indicating the ground truth category for each training image.
% test_image_feats is an M x d matrix, where d is the dimensionality of the
%  feature representation. You can assume M = N unless you've modified the
%  starter code.
% predicted_categories is an M x 1 cell array, where each entry is a string
%  indicating the predicted category for each test image.

%{
Useful functions:
 matching_indices = strcmp(string, cell_array_of_strings)
   This can tell you which indices in train_labels match a particular
   category. Not necessary for simple one nearest neighbor classifier.

 D = vl_alldist2(X,Y) 
    http://www.vlfeat.org/matlab/vl_alldist2.html
    returns the pairwise distance matrix D of the columns of X and Y. 
    D(i,j) = sum (X(:,i) - Y(:,j)).^2
    Note that vl_feat represents points as columns vs this code (and Matlab
    in general) represents points as rows. So you probably want to use the
    transpose operator ' 
   vl_alldist2 supports different distance metrics which can influence
   performance significantly. The default distance, L2, is fine for images.
   CHI2 tends to work well for histograms.
 
  [Y,I] = MIN(X) if you're only doing 1 nearest neighbor, or
  [Y,I] = SORT(X) if you're going to be reasoning about many nearest
  neighbors 

%}

[N, ~] = size(train_image_feats);
[M, ~] = size(test_image_feats);
D = zeros(M,N);
D = vl_alldist2(test_image_feats',train_image_feats');
labels_to_compare = unique(train_labels);
[D, I] = sort(D',2);
k = 5;
for i=1:M
	    count = zeros(size(labels_to_compare));
        from_train_labels = train_labels(I(i, 1:k));
        dum_counter = zeros(1,length(labels_to_compare));
        for j = 1:k
            id = strcmp(labels_to_compare, from_train_labels{j});
            dum_counter(id) = dum_counter(id) + 1;
        end        
        [v, id] = max(dum_counter);     
	    predicted_categories{i} = labels_to_compare{id};
end
predicted_categories = predicted_categories';
% for i = 1:10
%     predicted_categories(i,:) = train_labels(I(i));
%     disp( [ 'matching nummber happening :' num2str( i)]);
% end


