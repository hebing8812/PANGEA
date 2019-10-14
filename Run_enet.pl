# Usage perl Run_enet.pl <path> <name>

open(B,">err.txt");
open(A,"x.txt");
$s=0;
while(<A>){
    $s++;
}
if($s>2){
    system("Rscript $ARGV[0]/enet.R");
}else{
    print B "$ARGV[1] $s\n";
}

system("paste x.txt y.txt > Results/$ARGV[1].out.txt");

