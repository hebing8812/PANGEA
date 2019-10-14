library("elasticnet");
library("hdi");

a=read.table("Obe.txt");
b=read.table("Pre.txt");
b.m=as.matrix(b);
e=enet(b.m,a[,1],lambda=0.1);
s=round(dim(e$beta.pure)[1]/2);
if(dim(e$beta.pure)[1]>10){s=6;}
l=lasso.proj(b.m,a[,1],betainit=e$beta.pure[s,],sigma=1);

o=cbind(e$beta.pure[s,],l$pval.corr);
write.table(o,"y.txt",col.names=F,row.names=F,sep='\t');
