using LinearAlgebra, LowRankApprox, Formatting, ImageFiltering, Images, Plots, ImageMagick, Colors, TestImages, ImageView, ImageTransformations

I=load("rgb.jpg");

G=Gray.(I);
# size(G)

A=imresize(G, ratio=1/3);
# rank(A), size(A), eltype(A)

(p,q)=size(A);
B=Array{Float64}(A);

using DSP, Wavelets
B1=dwt(B, wavelet(WT.haar), 1);
B2=dwt(B, wavelet(WT.haar), 2);
B3=dwt(B, wavelet(WT.haar), 3);
B4=dwt(B, wavelet(WT.haar), 4);

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

C1a=idwt(B1a, wavelet(WT.haar), 1);
C2a=idwt(B2a, wavelet(WT.haar), 2);
C3a=idwt(B3a, wavelet(WT.haar), 3);
C4a=idwt(B4a, wavelet(WT.haar), 4);
C1d=idwt(B1d, wavelet(WT.haar), 1);
C2d=idwt(B2d, wavelet(WT.haar), 2);
C3d=idwt(B3d, wavelet(WT.haar), 3);
C4d=idwt(B4d, wavelet(WT.haar), 4);

A1a=Gray.(C1a);
A1d=Gray.(C1d);
A2a=Gray.(C2a);
A2d=Gray.(C2d);
A3a=Gray.(C3a);
A3d=Gray.(C3d);
A4a=Gray.(C4a);
A4d=Gray.(C4d);

plot(Gray.(A), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 0: Original Grayscale Image")
savefig("grayscale_haar_level0.png")

plot(Gray.(B1), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 1 (haar)")
savefig("grayscale_haar_level1.png")

plot(Gray.(C1a), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 1 Approximation (haar)")
savefig("grayscale_haar_level1_a.png")

plot(Gray.(C2a), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 2 Approximation (haar)")
savefig("grayscale_haar_level2_a.png")

plot(Gray.(C3a), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 3 Approximation (haar)")
savefig("grayscale_haar_level3_a.png")

plot(Gray.(C4a), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 4 Approximation (haar)")
savefig("grayscale_haar_level4_a.png")

plot(Gray.(C4d), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="Level 4 Detail (haar)")
savefig("grayscale_haar_level4_d.png")
