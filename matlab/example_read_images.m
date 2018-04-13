% EXAMPLE_READ_IMAGES  Code to read images for Oxford, ROxford, Paris, and RParis datasets.
% Revisited protocol (ROxford and RParis) requires query images to be removed from the database, and cropped prior to any processing.
% This code makes sure the protocol is strictly followed.
%
% More details about the revisited annotation and evaluation can be found in:
% Radenovic F., Iscen A., Tolias G., Avrithis Y., Chum O., Revisiting Oxford and Paris: Large-Scale Image Retrieval Benchmarking, CVPR 2018
%
% Authors: Radenovic F., Iscen A., Tolias G., Avrithis Y., Chum O., 2018

clear;

%---------------------------------------------------------------------
% Set data folder and testing parameters
%---------------------------------------------------------------------

% Set data folder, change if you have downloaded the data somewhere else
data_root = fullfile(fileparts(fileparts(mfilename('fullpath'))), 'data');
% Check, and, if necessary, download test data (Oxford and Pairs), 
% original and revisited annotation, and example feature vectors for evaluation
% download_test(data_root); 

% Set test dataset: oxford5k | roxford5k | paris6k | rparis6k
test_dataset = 'roxford5k';

%---------------------------------------------------------------------
% Read images
%---------------------------------------------------------------------

fprintf('>> %s: Processing test dataset...\n', test_dataset);		
% config file for the dataset
% separates query image list from database image list, if revisited protocol used
cfg = configdataset (test_dataset, fullfile(data_root, 'datasets/')); 

% query images
for i = 1:cfg.nq
	% crop query region before any processing
	qim = crop_qim(imread(cfg.qim_fname(cfg, i)), cfg.gnd(i).bbx);
	%%------------------------------------------------------
	%% Perform image processing here, eg, feature extraction
	%%------------------------------------------------------
	fprintf('>> %s: Processing query image %d\n', test_dataset, i);
end

% database images
for i = 1:cfg.n
	im = imread(cfg.im_fname(cfg, i));
	%%------------------------------------------------------
	%% Perform image processing here, eg, feature extraction
	%%------------------------------------------------------
	fprintf('>> %s: Processing database image %d\n', test_dataset, i);
end