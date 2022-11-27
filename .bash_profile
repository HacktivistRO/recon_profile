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
csprecon -h $1 | grep ">*.$1" | sort -u > 4.txt
sed -i 's/\*.//' 4.txt
echo "Subdomains from CSPRecon are"
cat 4.txt
echo "CSPRecon done"
sleep 2
clear
#Omnisint is down from a few days and is expected to show up soon. Please uncomment the following lines once Omnisint is up
#Please expect the error: "5.txt file not found" until Omnisint is up.
#echo "Running OmniSINT now"
#curl -s https://sonar.omnisint.io/subdomains/$TARGET | jq -r '.[]' | sort -u > 5.txt
#sed -i 's/\*.//' 5.txt
#echo "Subdomains from OmniSINT are"
#cat 4.txt
#echo "OmniSINT done"
#sleep 2
#clear
echo "enumerating subdomains using OpenSSL now"
openssl s_client -ign_eof 2>/dev/null <<< $'HEAD / HTTP/1.0\r\n\r' -connect "$1:443" | openssl x509 -noout -text -in - | grep 'DNS' | sed -e 's|DNS:|\n|g' -e 's|^\*.*||g' | tr -d ',' > 6.txt
sed -i 's/\*.//' 6.txt
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
rm 1.txt 2.txt 3.txt 4.txt subdomains.txt
echo "Live subdomains stored in subdomains_$1.txt file"
echo "Subdomains for $1"
cat subdomains_$1.txt
}
