#!usr/bin/awk -f
#version 0.0


/^@/ {
name = $0
#print name
}

/.*(AGGGTGCAAGCGTTAATCGGAATTACTGGGCGTA)/ {
  barcode = "#It will work"
  name = name " " barcode
#print name
}

/^[ATCG]/{
  sequence = $0
#  print sequence
}


/^\+/{
  useless = $0
#  print useless
}

/^]|P/{
  quality = $0
#  print quality
  print name"\n",sequence"\n",useless"\n",quality"\n"
}
