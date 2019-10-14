a=read.table("Obe.txt");
b=read.table("Pre.txt");
x=NULL;
y=dim(b)[2];
for(i in 1:y){
 t=cor.test(a[,1],b[,i]);
 x=c(x,t$p.value);
}

write.table(x,"y.txt",col.names=F,row.names=F);
