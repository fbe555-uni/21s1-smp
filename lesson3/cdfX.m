function cdfX=cdf(x,X,xa,xb)
cdfX=0;
if xa<=x<=xb
    for xn=xa:x
        cdfX=cdfX+X(xn);
    end
elseif x>xb
    cdfX=1;
end
