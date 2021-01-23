using LinearAlgebra, LowRankApprox, Formatting, ImageFiltering, Images, Plots, ImageMagick, Colors, TestImages, ImageView, ImageTransformations

I=load("rgb.jpg");
X=imresize(I, ratio=1/5);
(p,q)=size(X);
A=channelview(X);
R=Array{Float64}(A[1,:,:]);
G=Array{Float64}(A[2,:,:]);
B=Array{Float64}(A[3,:,:]);

RU, RS, RV=psvd(R);
GU, GS, GV=psvd(G);
BU, BS, BV=psvd(B);

R010=sum(RS[n]*RU[1:p,n]*(RV[1:q,n])' for n=1:10);
R020=sum(RS[n]*RU[1:p,n]*(RV[1:q,n])' for n=1:20);
R030=sum(RS[n]*RU[1:p,n]*(RV[1:q,n])' for n=1:30);
R040=sum(RS[n]*RU[1:p,n]*(RV[1:q,n])' for n=1:40);
R050=sum(RS[n]*RU[1:p,n]*(RV[1:q,n])' for n=1:50);
G010=sum(GS[n]*GU[1:p,n]*(GV[1:q,n])' for n=1:10);
G020=sum(GS[n]*GU[1:p,n]*(GV[1:q,n])' for n=1:20);
G030=sum(GS[n]*GU[1:p,n]*(GV[1:q,n])' for n=1:30);
G040=sum(GS[n]*GU[1:p,n]*(GV[1:q,n])' for n=1:40);
G050=sum(GS[n]*GU[1:p,n]*(GV[1:q,n])' for n=1:50);
B010=sum(BS[n]*BU[1:p,n]*(BV[1:q,n])' for n=1:10);
B020=sum(BS[n]*BU[1:p,n]*(BV[1:q,n])' for n=1:20);
B030=sum(BS[n]*BU[1:p,n]*(BV[1:q,n])' for n=1:30);
B040=sum(BS[n]*BU[1:p,n]*(BV[1:q,n])' for n=1:40);
B050=sum(BS[n]*BU[1:p,n]*(BV[1:q,n])' for n=1:50);

A010=zeros(3,p,q);
A020=zeros(3,p,q);
A030=zeros(3,p,q);
A040=zeros(3,p,q);
A050=zeros(3,p,q);

A010[1,:,:]=R010;
A010[2,:,:]=G010;
A010[3,:,:]=B010;
A020[1,:,:]=R020;
A020[2,:,:]=G020;
A020[3,:,:]=B020;
A030[1,:,:]=R030;
A030[2,:,:]=G030;
A030[3,:,:]=B030;
A040[1,:,:]=R040;
A040[2,:,:]=G040;
A040[3,:,:]=B040;
A050[1,:,:]=R050;
A050[2,:,:]=G050;
A050[3,:,:]=B050;

X010=colorview(RGB, A010);
X020=colorview(RGB, A020);
X030=colorview(RGB, A030);
X040=colorview(RGB, A040);
X050=colorview(RGB, A050);

plot(X, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A=A(365) 365 by 548 full rank matrix")
savefig("rgb_svd_365.png")

plot(X010, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A(10) rank 10 approximation")
savefig("rgb_svd_010.png")

plot(X020, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A(20) rank 20 approximation")
savefig("rgb_svd_020.png")

plot(X030, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A(30) rank 30 approximation")
savefig("rgb_svd_030.png")

plot(X040, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A(40) rank 40 approximation")
savefig("rgb_svd_040.png")

plot(X050, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="A(50) rank 50 approximation")
savefig("rgb_svd_050.png")





