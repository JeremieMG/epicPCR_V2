# /!\ This repository is useless /!\




# epicPCR_V2

# Barcoder.awk (New script)
Find a barcode given in the fastq sequence. 
Add this barcode in the header of the sequence.
The fastq file is now usable in the fastq2Qiime_barcode_V2.pl

# fastq2Qiime_barcode_V2.pl (Re-write script)
Modified script from fastq2Qiime_barcode\_.pl (https://github.com/sjspence/epicPCR)
Modified line 13: The symbol "@" used for the chomp function had to find only the header of the sequence. But the symbol was find in the quality sequence too. The expression was changed to "@SRR".
