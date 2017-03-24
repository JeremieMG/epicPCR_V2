#!usr/bin/awk -f
#version 1.0

#Save the Header
/^@/ {
header = $0
barcode=""
condition= 0
}

#Find and save the barcode. Save the sequence
/.*(TCCGTGCGC)|(TGTTTCCCA)|(GGTAATGAA)|(GAAACTGGG)|(ACGGGCTGA)|(ATGAAGTAT)|(ACTTATTGT)|(GGCGGGAAA)|(ACACCTCGG)|(CTCATTGGG).+/ {
  match($0,"(TCCGTGCGC)|(TGTTTCCCA)|(GGTAATGAA)|(GAAACTGGG)|(ACGGGCTGA)|(ATGAAGTAT)|(ACTTATTGT)|(GGCGGGAAA)|(ACACCTCGG)|(CTCATTGGG)", a)
  barcode = "#"a[0]

  name = header " " barcode
}

#Save the sequence
/^[ATCG]/{
  sequence =$0
}

#Save the "Quality commentary"
/^\+/{
  useless =$0
}

#Save the quality
/^.*\[|`/{
 quality =$0
  condition= 1
}

#Print only if a barcade was in the sequence
{
if(barcode != "" && condition==1)
        print name"\n"sequence"\n"useless"\n"quality"\n"
}
