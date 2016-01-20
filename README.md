# bag_of_words
The goal of this project is to introduce you to image recognition. Specifically, we will examine the task of scene recognition starting with very simple methods -- bags of quantized local features, nearest neighborhood and linear classifiers learned by support vector machines.

Bag of words models are a popular technique for image classification inspired by models used in natural language processing. The model ignores or downplays word arrangement (spatial information in the image) and classifies based on a histogram of the frequency of visual words. The visual word "vocabulary" is established by clustering a large corpus of local features. See Szeliski chapter 14.4.1 for more details on category recognition with quantized features. In addition, 14.3.2 discusses vocabulary creation and 14.1 covers classification techniques.
    
For this project you will be implementing a basic bag of words model with many opportunities for extra credit. You will classify scenes into one of 15 categories by training and testing on the 15 scene database (introduced in Lazebnik et al. 2006, although built on top of previously published datasets). Lazebnik et al. 2006 is a great paper to read, although we will be implementing the baseline method the paper discusses (equivalent to the zero level pyramid) and not the more sophisticated spatial pyramid (which is extra credit).

# Details and Starter Code
The top level script for this project is proj3.m. If you run it unchanged, it will randomly guess the category of every test image and achieve about 7% accuracy by doing so (1 out of 15 guesses are correct).
You are required to implement 2 different image representations -- tiny images and bags of SIFT features -- and 2 different classification techniques -- nearest neighbor and linear SVM. In the write-up, you are specifically asked to report performance for the following combinations, and it is also highly recommended that you implement them in this order:
 Bag of SIFT representation and nearest neighbor classifier (accuracy of about 50- 60%).
  
 Bag of SIFT representation and linear SVM classifier (accuracy of about 60-70%).
