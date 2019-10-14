use Getopt::Long;

if(@ARGV < 16){
    print "Usage:perl PANGA.pl -d <Path to PANGA directroy> -n <gene name> -g <gene expression> -p <list of patient> -e <EP pairs> -a <SNV> -b <TRA/INV> -c <CNV>\n";
    exit;
}
GetOptions('d=s'=>\$PATH, 'n=s'=>\$name, 'g=s'=>\$ge, 'p=s'=>\$pa, 'e=s'=>\$ep, 'a=s'=>\$snv, 'b=s'=>\$tra, 'c=s'=>\$cnv);

system("mkdir Results");
# Input <gene expr> <patient list> Out: Obe.txt
system("perl $PATH/extractGeneExpr.pl $ge $pa");
# Input <EP> <snv> <tra> <cnv> Out: enhmut.txt
system("perl $PATH/extractEnhMut.pl $ep $snv $tra $cnv");
# Input <EP> <patient> Out: x.txt Pre.txt
system("perl $PATH/EPDisrupt.pl $ep $pa");
# Input <gene name>
system("perl $PATH/Run_enet.pl $PATH $name");

system("perl $PATH/summary.pl > nonc_mut.output");
