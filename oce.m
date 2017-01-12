function [err] = oce(im,gt)
%% OCE Object-level consistency error

unique_gt=unique(gt);
unique_im=unique(im);
err=min(egs(im,gt,unique_im,unique_gt),egs(gt,im,unique_gt,unique_im));
end

function [res] = egs(im,gt,unique_im,unique_gt)
wj=hist(gt(:),unique_gt);
if unique_gt(1)==0
    unique_gt=unique_gt(2:end);
    wj=wj(2:end);
end
wj=wj/sum(wj);
wji=repmat(hist(im(:),unique_im),length(unique_gt),1);
if unique_im(1)==0
    unique_im=unique_im(2:end);
    wji=wji(:,2:end);
end

res=0;
for i=1:length(unique_gt)
    res1=0;
    for j=1:length(unique_im)
        n=sum((im(:)==unique_im(j)) & (gt(:)==unique_gt(i)));
        u=sum((im(:)==unique_im(j)) | (gt(:)==unique_gt(i)));
        wji(i,j)=wji(i,j)*(n~=0);
        res1=res1+n*wj(i)*wji(i,j)/u;
    end
    res=res+res1/sum(wji(i,:));
end
res=1-res;

end