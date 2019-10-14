# Usage perl EPDisrupt.pl <EP> <patient>

open(A,"enh_mut.txt");
open(B,$ARGV[0]);#EP pairs
open(E,$ARGV[1]);# patient list

open(C,">x.txt"); # enhancers with mutation
open(D,">Pre.txt"); #predictors for regression model
close D;

@nn=();
while(<E>){
    chomp;
    push(@nn,$_);
    $h{$_}=1;
}

@snv=();
@cnv=();
@tra=();
@sp=();
@tp=();
@cp=();
while(<A>){
    @a=split(/\s+/,$_);
    if($a[0] eq "snv"){
	push(@snv,$a[3]);
	push(@sp,$a[1]);
	$n=$a[2];
    }elsif(@a[0] eq "cnv"){
	push(@cnv,$a[3]);
	push(@cnv,$a[5]);
	push(@cp,$a[1]);
	push(@cp,$a[1]);
    }else{
	if($a[2] eq $n){
	    push(@tra,$a[3]);
	    push(@tp,$a[1]);
	}
	if($a[5] eq $n){
	    push(@tra,$a[6]);
	    push(@tp,$a[1]);
	}
    }
}
$ns=@snv;
$nc=@cnv;
$nt=@tra;

while(<B>){
    @a=split(/\s+/,$_);
    $s1=0;$s2=0;$s3=0;
    for($i=0;$i<$ns;$i++){
	if(($snv[$i]>$a[1])&&($snv[$i]<$a[2])){
	    if($h{$sp[$i]}==1){
		$g{$sp[$i]}=1;
		$s1++;
	    }
	}
    }
    for($i=0;$i<$nc;$i++){
	if(($cnv[$i]>$a[1])&&($cnv[$i]<$a[2])){
	    if($h{$cp[$i]}==1){
		$k{$cp[$i]}=1;
		$s2++;
	    }
	}
    }
    for($i=0;$i<$nt;$i++){
	if(($tra[$i]>$a[2])&&($tra[$i]<$a[4])){
	    if($h{$tp[$i]}==1){
		$j{$tp[$i]}=1;
		$s3++;
	    }
	}elsif(($tra[$i]>$a[4])&&($tra[$i]<$a[1])){
	    if($h{$tp[$i]}==1){
		$j{$tp[$i]}=1;
		$s3++;
	    }
	}
    }
    
    print "$s1 $s2 $s3\n";
    
    if($s1>=3){
	open(F,">out.txt");
	foreach $i(@nn){
	    if(exists $g{$i}){
		print F "1\n";
	    }else{
		print F "0\n";
	    }
	}
	print C "$a[0]-$a[1]-$a[2]-snv\n";
	close F;
	system("paste Pre.txt out.txt > tmp");
	system("mv tmp Pre.txt");
    }
   
    if($s2>=3){
        open(F,">out.txt");
	foreach $i(@nn){
            if(exists $k{$i}){
                print F "1\n";
            }else{
		print F "0\n";
            }
	}
	print C"$a[0]-$a[1]-$a[2]-cnv\n";
	close F;
	system("paste Pre.txt out.txt > tmp");
	system("mv tmp Pre.txt");
    }

    if($s3>=2){
        open(F,">out.txt");
	foreach $i(@nn){
            if(exists $j{$i}){
                print F "1\n";
            }else{
		print F "0\n";
            }
	}
	print C "$a[0]-$a[1]-$a[2]-break\n";
	close F;
	system("paste Pre.txt out.txt > tmp");
	system("mv tmp Pre.txt");
    }
}
