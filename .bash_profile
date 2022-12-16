#!/bin/bash

#Single command to find reflected XSS on any target
xss() 
{
subdomains $1
echo "Subdomain enumeration done. Now finding Reflected XSS on them."
printf subdomains_$1.txt | gau | grep '=' | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'
rm subdomains_$1.txt
}
# command to find unique live subdomains 
subdomains()
{
echo "Running Cero now"
cero -d $1 | grep ">*.$1" | sort -u  > 1.txt
sed -i 's/\*.//' 1.txt
sed -i 's/\.//' 1.txt 
echo  "Subdomains found from cero are"
cat 1.txt
sleep 2
clear
echo "Cero done"
echo "Running crt.sh now"
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF' > 2.txt
sed -i 's/\*.//' 2.txt
sed -i 's/\.//' 2.txt 
echo "subdomains found from crt.sh are"
cat 2.txt
echo "crt.sh done"
sleep 2
clear
echo "Running subfinder now"
subfinder -d $1 -silent -recursive -all | grep ">*.$1" | sort -u > 3.txt
sed -i 's/\*.//' 3.txt
echo "subdomains from subfinder are"
cat 3.txt
echo "Subfinder done"
sleep 2
clear
echo "Running CSPRecon now"
csprecon -u https://$1 -s | grep ">*.$1" | sort -u > 4.txt
sed -i 's/\*.//' 4.txt
echo "Subdomains from CSPRecon are"
cat 4.txt
echo "CSPRecon done"
sleep 2
clear
echo "Running Amass now"
amass enum -d $1 -active -passive -o 5.txt
sed -i 's/\*.//' 5.txt
echo "Subdomains from Amass are"
cat 5.txt
echo "Amass done"
sleep 2
clear
echo "enumerating subdomains using OpenSSL now"
true | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -text  | perl -l -0777 -ne '@names=/\bDNS:([^\s,]+)/g; print join("\n", sort @names);' > 6.txt
sed  -i 's/\*.//' 6.txt
echo "Subdomains from OpenSSL are"
cat 6.txt
echo "OpenSSL done"
sleep 2
clear
echo "Removing duplicate and dead subdomains now"
cat 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt | grep ">*.$1" > subdomains.txt
sed -i 's/\*//' subdomains.txt
sed -i 's/\.//' subdomains.txt
cat subdomains.txt | sort -u | httprobe > subdomains_$1.txt
rm 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt subdomains.txt
echo "Live subdomains stored in subdomains_$1.txt file"
echo "Subdomains are:"
cat subdomains_$1.txt
}
