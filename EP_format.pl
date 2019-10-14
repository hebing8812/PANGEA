# perl EP_format.pl <EP_pairs> 
# output: input.txt (input file for PANGA)

open(A,$ARGV[0]);
open(B,">input.txt");
$l=<A>;
@a=split(/\s+/,$l);
$n=$a[3];
$s=1;
print B "$n\t$s\t";
while(<A>){
    @a=split(/\s+/,$_);
    if($n ne $a[3]){
	$n=$a[3];
	print B "$s\n";
	$s++;
	print B "$n\t$s\t";
    }else{
	$s++;
    }
}
print B "$s\n";
