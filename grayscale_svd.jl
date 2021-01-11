using GR, LinearAlgebra, LowRankApprox, Formatting, ImageFiltering, Images, Plots, ImageMagick, Colors, TestImages, ImageView, ImageTransformations

I=load("rgb.jpg")

G=Gray.(I)
# size(G)

A=imresize(G, ratio=1/5)
# rank(A), size(A), eltype(A)

(p,q)=size(A)
B=Array{Float64}(A)
U, S, V=psvd(B)
B010=sum(S[n]*U[1:p,n]*(V[1:q,n])' for n=1:10);
B030=sum(S[n]*U[1:p,n]*(V[1:q,n])' for n=1:30);
B050=sum(S[n]*U[1:p,n]*(V[1:q,n])' for n=1:50);
B700=sum(S[n]*U[1:p,n]*(V[1:q,n])' for n=1:70);

plot(Gray.(B), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="B=B(365) 365 by 548 full rank matrix")
savefig("rgb_svd_365.png")

plot(Gray.(B010), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="B(10) rank 10 approximation")
savefig("rgb_svd_010.png")

plot(Gray.(B030), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="B(30) rank 30 approximation")
savefig("rgb_svd_030.png")

plot(Gray.(B050), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="B(50) rank 50 approximation")
savefig("rgb_svd_050.png")

plot(Gray.(B070), 
    xaxis=false, 
    xticks=false, 
    yaxis=false, 
    yticks=false, 
    grid=false, 
    title="B(70) rank 70 approximation")
savefig("rgb_svd_070.png")

