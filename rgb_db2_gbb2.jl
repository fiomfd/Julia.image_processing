using LinearAlgebra, LowRankApprox, Formatting, ImageFiltering, Images, Plots, ImageMagick, Colors, TestImages, ImageView, ImageTransformations

I=load("fl2.jpg");
X=imresize(I, ratio=1/3);
(p,q)=size(X);
A=channelview(X);
R=Array{Float64}(A[1,:,:]);
G=Array{Float64}(A[2,:,:]);
B=Array{Float64}(A[3,:,:]);

using DSP, Wavelets
R1=dwt(R, wavelet(WT.db2), 1);
R2=dwt(R, wavelet(WT.db2), 2);
R3=dwt(R, wavelet(WT.db2), 3);
R4=dwt(R, wavelet(WT.db2), 4);
G1=dwt(G, wavelet(WT.db2), 1);
G2=dwt(G, wavelet(WT.db2), 2);
G3=dwt(G, wavelet(WT.db2), 3);
G4=dwt(G, wavelet(WT.db2), 4);
B1=dwt(B, wavelet(WT.db2), 1);
B2=dwt(B, wavelet(WT.db2), 2);
B3=dwt(B, wavelet(WT.db2), 3);
B4=dwt(B, wavelet(WT.db2), 4);

R1a=zeros(Float64, p, q);
R2a=zeros(Float64, p, q);
R3a=zeros(Float64, p, q);
R4a=zeros(Float64, p, q);
R1a[1:Int(p/2),1:Int(q/2)]=R1[1:Int(p/2),1:Int(q/2)];
R2a[1:Int(p/4),1:Int(q/4)]=R2[1:Int(p/4),1:Int(q/4)];
R3a[1:Int(p/8),1:Int(q/8)]=R3[1:Int(p/8),1:Int(q/8)];
R4a[1:Int(p/16),1:Int(q/16)]=R4[1:Int(p/16),1:Int(q/16)];
R1d=R1-R1a;
R2d=R2-R2a;
R3d=R3-R3a;
R4d=R4-R4a;
G1a=zeros(Float64, p, q);
G2a=zeros(Float64, p, q);
G3a=zeros(Float64, p, q);
G4a=zeros(Float64, p, q);
G1a[1:Int(p/2),1:Int(q/2)]=G1[1:Int(p/2),1:Int(q/2)];
G2a[1:Int(p/4),1:Int(q/4)]=G2[1:Int(p/4),1:Int(q/4)];
G3a[1:Int(p/8),1:Int(q/8)]=G3[1:Int(p/8),1:Int(q/8)];
G4a[1:Int(p/16),1:Int(q/16)]=G4[1:Int(p/16),1:Int(q/16)];
G1d=G1-G1a;
G2d=G2-G2a;
G3d=G3-G3a;
G4d=G4-G4a;
B1a=zeros(Float64, p, q);
B2a=zeros(Float64, p, q);
B3a=zeros(Float64, p, q);
B4a=zeros(Float64, p, q);
B1a[1:Int(p/2),1:Int(q/2)]=B1[1:Int(p/2),1:Int(q/2)];
B2a[1:Int(p/4),1:Int(q/4)]=B2[1:Int(p/4),1:Int(q/4)];
B3a[1:Int(p/8),1:Int(q/8)]=B3[1:Int(p/8),1:Int(q/8)];
B4a[1:Int(p/16),1:Int(q/16)]=B4[1:Int(p/16),1:Int(q/16)];
B1d=B1-B1a;
B2d=B2-B2a;
B3d=B3-B3a;
B4d=B4-B4a;


RR1a=idwt(R1a, wavelet(WT.db2), 1);
RR2a=idwt(R2a, wavelet(WT.db2), 2);
RR3a=idwt(R3a, wavelet(WT.db2), 3);
RR4a=idwt(R4a, wavelet(WT.db2), 4);
RR1d=idwt(R1d, wavelet(WT.db2), 1);
RR2d=idwt(R2d, wavelet(WT.db2), 2);
RR3d=idwt(R3d, wavelet(WT.db2), 3);
RR4d=idwt(R4d, wavelet(WT.db2), 4);
GG1a=idwt(G1a, wavelet(WT.db2), 1);
GG2a=idwt(G2a, wavelet(WT.db2), 2);
GG3a=idwt(G3a, wavelet(WT.db2), 3);
GG4a=idwt(G4a, wavelet(WT.db2), 4);
GG1d=idwt(G1d, wavelet(WT.db2), 1);
GG2d=idwt(G2d, wavelet(WT.db2), 2);
GG3d=idwt(G3d, wavelet(WT.db2), 3);
GG4d=idwt(G4d, wavelet(WT.db2), 4);
BB1a=idwt(B1a, wavelet(WT.db2), 1);
BB2a=idwt(B2a, wavelet(WT.db2), 2);
BB3a=idwt(B3a, wavelet(WT.db2), 3);
BB4a=idwt(B4a, wavelet(WT.db2), 4);
BB1d=idwt(B1d, wavelet(WT.db2), 1);
BB2d=idwt(B2d, wavelet(WT.db2), 2);
BB3d=idwt(B3d, wavelet(WT.db2), 3);
BB4d=idwt(B4d, wavelet(WT.db2), 4);

A1a=zeros(3,p,q);
A1d=zeros(3,p,q);
A2a=zeros(3,p,q);
A2d=zeros(3,p,q);
A3a=zeros(3,p,q);
A3d=zeros(3,p,q);
A4a=zeros(3,p,q);
A4d=zeros(3,p,q);

A1a[1,:,:]=RR1a;
A1a[2,:,:]=GG1a;
A1a[3,:,:]=BB1a;
A1d[1,:,:]=RR1d;
A1d[2,:,:]=GG1d;
A1d[3,:,:]=BB1d;
A2a[1,:,:]=RR2a;
A2a[2,:,:]=GG2a;
A2a[3,:,:]=BB2a;
A2d[1,:,:]=RR2d;
A2d[2,:,:]=GG2d;
A2d[3,:,:]=BB2d;
A3a[1,:,:]=RR3a;
A3a[2,:,:]=GG3a;
A3a[3,:,:]=BB3a;
A3d[1,:,:]=RR3d;
A3d[2,:,:]=GG3d;
A3d[3,:,:]=BB3d;
A4a[1,:,:]=RR4a;
A4a[2,:,:]=GG4a;
A4a[3,:,:]=BB4a;
A4d[1,:,:]=RR4d;
A4d[2,:,:]=GG4d;
A4d[3,:,:]=BB4d;

X1a=colorview(RGB, A1a);
X1d=colorview(RGB, A1d);
X2a=colorview(RGB, A2a);
X2d=colorview(RGB, A2d);
X3a=colorview(RGB, A3a);
X3d=colorview(RGB, A3d);
X4a=colorview(RGB, A4a);
X4d=colorview(RGB, A4d);

plot(X, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 0: Original RGB Image")
savefig("rgb_db2_gbb2_level0.png")

plot(X1a, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 1 Approximation (db2)")
savefig("rgb_db2_gbb2_level1_a.png")

plot(X1d, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 1 Detail (db2)")
savefig("rgb_db2_gbb2_level1_d.png")

plot(X2a, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 2 Approximation (db2)")
savefig("rgb_db2_gbb2_level2_a.png")

plot(X2d, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 2 Detail (db2)")
savefig("rgb_db2_gbb2_level2_d.png")

plot(X3a, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 3 Approximation (db2)")
savefig("rgb_db2_gbb2_level3_a.png")

plot(X3d, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 3 Detail (db2)")
savefig("rgb_db2_gbb2_level3_d.png")

plot(X4a, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 4 Approximation (db2)")
savefig("rgb_db2_gbb2_level4_a.png")

plot(X4d, 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 4 Detail (db2)")
savefig("rgb_db2_gbb2_level4_d.png")



