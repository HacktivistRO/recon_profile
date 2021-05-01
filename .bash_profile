#Single command to find reflected XSS on any target
xss() 
{
subdomains $1 | gau | grep '=' | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'
rm subdomains_$1.txt
}
# command to find unique live subdomains 
subdomains()
{
echo "Running crt.sh now"
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF' > 1.txt
echo "crt.sh done"
echo "Running subfinder now"
subfinder -d $1 -silent -recursive -all > 2.txt
echo "Subfinder done"
echo "Removing duplicate and dead subdomains now"
cat 1.txt 2.txt | sort -u | httprobe -prefer-https > subdomains_$1.txt
rm 1.txt 2.txt 
echo "Live subdomains stored in subdomains_$1.txt file"
echo "Subdomains for $1"
cat subdomains_$1.txt
}
