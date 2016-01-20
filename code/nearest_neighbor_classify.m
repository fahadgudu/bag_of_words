% % Nearest neighbourhood

% The nearest neighbor classifer just computes the distances between training image 
% features and test image features. Test features are assigned labels of the features
% with the minimum distance to the specific feature in the training image. At the end,
% these distances are sorted so that labels that are the closest can be used to make
% a decision about what the classification is for the test image.
% i took 5 neighbourhood and sort them and one with most count will be
% assign a label.
function predicted_categories = nearest_neighbor_classify(train_image_feats, train_labels, test_image_feats)
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
end
