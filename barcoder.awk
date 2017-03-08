#!usr/bin/awk -f
#version 2.0

#Save the Header
/^@/ {
header = $0
condition = 0
}

#Save the barcode and the sequence
/^[ATCG]/ {
  barcode = substr($0,0,8)
  sequence =$0
  name = header " #"barcode
}

#Save the "Quality commentary"
/^\+/{
  useless =$0
}

#Save the quality and print the lines
/^.*\[|`/{
 quality =$0
 condition = 1
 print name"\n"sequence"\n"useless"\n"quality
}
