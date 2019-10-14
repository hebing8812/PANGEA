# Usage: perl extractEnhMut.pl <EP pairs> <snv> <break points> <cnv>

open(A,$ARGV[0]);#EP pairs
open(B,$ARGV[1]);#snv
open(C,$ARGV[2]);#break points
open(D,$ARGV[3]);#cnv
open(E,">enh_mut.txt");
while(<A>){
    @a=split(/\s+/,$_);
    for($i=$a[1];$i<=$a[2];$i++){
	$n="$a[0]-$i";
	$h{$n}=1;
    }
    if($a[1]>$a[4]){
	for($i=int($a[4]/100);$i<=int($a[1]/100);$i++){
	    $n="$a[0]-$i";
	    $g{$n}=1;
	}
    }else{
	for($i=int($a[2]/100);$i<=int($a[4]/100);$i++){
	    $n="$a[0]-$i";
	    $g{$n}=1;
	}
    }
}

while(<B>){
    @a=split(/\s+/,$_);
    $n="$a[1]-$a[2]";
    if($h{$n}==1){
	print E "snv\t$_";
    }
}

while(<C>){
    @a=split(/\s+/,$_);
    $a[2]=int($a[2]/100);
    $a[5]=int($a[5]/100);
    $n1="$a[1]-$a[2]";
    $n2="$a[4]-$a[5]";
    if(($g{$n1}==1)||($g{$n2}==1)){
	print E "bp\t$_";
    }
}

while(<D>){
    @a=split(/\s+/,$_);
    $n1="$a[1]-$a[2]";
    $n2="$a[4]-$a[5]";
    if(($h{$n1}==1)||($h{$n2}==1)){
	print E "cnv\t$_";
    }
}
