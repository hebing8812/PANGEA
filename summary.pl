@file=glob("Results/*");
foreach $f(@file){
    open(A,$f);
    @n=split(/\//,$f);
    @n=split(/\./,$n[1]);
    while(<A>){
	@a=split(/\s+/,$_);
	if($a[1]<1E-2){
	    print "$n[0]\t$_";
	}
    }
}
