Anchor Graph Hashing for Large-Scale Nearest Neighbor Search [Code]
----
####Terms of Use

Copyright (c) 2012 by DVMM Laboratory

Department of Electrical Engineering</br>
Columbia University</br>
Rm 1312 S.W. Mudd, 500 West 120th Street</br>
New York, NY 10027</br>
USA

If it is your intention to use this code for non-commercial purposes, such as in academic research, this code is free.

If you use this code in your research, please acknowledge the authors, and cite our related publication:

Wei Liu, Jun Wang, Sanjiv Kumar, and Shih-Fu Chang, "Hashing with Graphs," International Conference on Machine Learning (ICML), Bellevue, Washington, USA, 2011

####Instruction
Please first see demo_AGH.m to find how my codes work.

To run AGH, one needs to input anchors. In my ICML'11 paper, I used K-means clustering centers 
as anchors. If one had any sophisticated or task specific clustering algorithms, it could be better to feed 
the resulting clustering centers to anchors. Nevertheless, I found K-means anchors are sufficiently good.

Another possible issue is kernel. I used Gaussian RBF kernel throughout my paper, but any other kernels are
admittable (the clustering algorithm should be compatible with kernels). Please ask me if you do not know 
how to incorporate other kernels. For two important parameters, m and s, used in my method, I just simply fix
m=300 and tune s to proper values (e.g., 2<=s<=m/10) on different datasets.

For any problem with my codes, feel free to drop me a message via wliu@ee.columbia.edu. Also, I hope you
to cite my ICML'11 paper in your publications.

Wei Liu
June 2, 2012

  






 