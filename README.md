Predictive Analysis of Noncoding Genomic Alterations

# Input Files
1) Gene expression in patients.
   '''Format: [Patient ID]\t[FPKM]\n
2) EP pairs.
   Format: <Enh-Chr>\t<Enh-Start>\t<Enh-End>\t<Pro-Chr>\t<Pro-Position>\t<Gene>\n
3) Patient IDs.
   Format: <ID>\n
4) SNVs in patients.
   Format: <Patient ID>\t<Chr>\t<Position>\n
5) Translocation/Inversion break points.
   Format: <Patient ID>\t<BP1-Chr>\t<Position>\t<Strand>\t<BP2-Chr>\t<Position>\t<Strand>\n
6) Duplication/Deletion break points.
   Format: <Patient ID>\t<BP1-Chr>\t<Position>\t<Strand>\t<BP2-Chr>\t<Position>\t<Strand>\n

# Usage
perl PANGEA.pl -d <Path to PANGEA directroy> -n <gene name> -g <gene expression> -p <list of patient> -e <EP pairs> -a <SNV> -b <TRA/INV> -c <CNV>
