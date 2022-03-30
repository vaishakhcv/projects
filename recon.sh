#! /bin/bash 
mkdir tmp 
assetfinder -subs-only $1 |tee tmp/temp_subs.txt 
cat tmp/temp_subs.txt | httprobe | tee tmp/tmp_live.txt 
while read url; do
 echo ${url#*//} >> tmp/urls.txt
done < tmp/tmp_live.txt 
mkdir $1 
sort -u tmp/urls.txt > $1/sorted_sub.txt  
rm -r tmp 
echo "++++Process Complete+++ Sorted subdomains are stored in $1/sorted_sub.txt"