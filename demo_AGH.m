
load mnist_split;
[n,dim] = size(traindata);
tn = size(testdata,1);
m = 300; %number of anchors, I simply fix this parameter 
s = 2;   %number of nearest anchors, please tune this parameter on different datasets
r = [12,16,24,32,48,64]; %number of hash bits


%% Please run K-means clustering to get m anchor points 
load anchor_300;


%% One-Layer AGH
ham2_pre1 = zeros(1,length(r));
for i = 1:length(r)
    [Y, W, sigma] = OneLayerAGH_Train(traindata, anchor, r(i), s, 0);
    tY = OneLayerAGH_Test(testdata, anchor, W, s, sigma);
    clear W;
    
    % compute hamming distance
    B = compactbit(Y);
    tB = compactbit(tY);
    clear Y;
    clear tY;
    HamDis = hammingDist(B,tB); 
    clear B;
    clear tB;
    
    % compute hamming radius 2 precision
    pre = zeros(1,tn);
    for j = 1:tn
        ham = HamDis(:,j); 
        list = find(ham <= 2);
        ln = length(list);
        if ln == 0
            pre(j) = 0; %fail to find any neighbors
        else
            pre(j) = length(find(traingnd(list) == testgnd(j)))/ln;
        end
        clear list;    
        clear ham;
    end
    ham2_pre1(i) = mean(pre,2);
end    
clear HamDis;
clear pre;

for i = 1:length(r)
    fprintf('\n 1-AGH: the Hamming radius 2 precision for %d bits is %f.', r(i),ham2_pre1(i));
end
fprintf('\n'); 

%% Two-Layer AGH
ham2_pre2 = zeros(1,length(r));
for i = 1:length(r)
    [Y, W, thres, sigma] = TwoLayerAGH_Train(traindata, anchor, r(i), s, 0);
    tY = TwoLayerAGH_Test(testdata, anchor, W, thres, s, sigma);
    clear W;
    clear thres;
    
    % compute hamming distance
    B = compactbit(Y);
    tB = compactbit(tY);
    clear Y;
    clear tY;
    HamDis = hammingDist(B,tB); 
    clear B;
    clear tB;
    
    % compute hamming radius 2 precision
    pre = zeros(1,tn);
    for j = 1:tn
        ham = HamDis(:,j); 
        list = find(ham <= 2);
        ln = length(list);
        if ln == 0
            pre(j) = 0; %fail to find any neighbors
        else
            pre(j) = length(find(traingnd(list) == testgnd(j)))/ln;
        end
        clear list;    
        clear ham;
    end
    ham2_pre2(i) = mean(pre,2);
end    
clear HamDis;
clear pre;

for i = 1:length(r)
    fprintf('\n 2-AGH: the Hamming radius 2 precision for %d bits is %f.', r(i),ham2_pre2(i));
end
fprintf('\n'); 

