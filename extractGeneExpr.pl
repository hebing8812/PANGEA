# perl extractGeneExpr.pl <gene expr in patients> <patient list>
# Required input: patient.txt (list of patient IDs in the study)
# output: Obe.txt (input for enet model)

open(C,">Obe.txt");
open(A,$ARGV[0]);
$s=0;
while(<A>){
    @a=split(/\s+/,$_);
    if(/PA/){
	$h{$a[0]}=$a[1];
    }else{
	$s+=$a[1];
    }
}
$s=$s/20;
open(B,$ARGV[1]);
while(<B>){
    chomp;
    if(! exists $h{$_}){
	$h{$_}=0;
    }
    #$s1=$h{$_}-$s;
    #$s2=($h{$_}+0.001)/($s+0.001);
    print C "$h{$_}\n";
}
