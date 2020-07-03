#Single command to find reflected XSS on any target
xss() 
{
assetfinder $1 -subs-only | gau | grep '=' | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'
}
# command to find unique subdomains from certspotter and crt.sh
subdomains()
{
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1 > 1.txt
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF' > 2.txt
subfinder -d %$1 -silent > 3.txt
cat 1.txt 2.txt 3.txt | sort -u > subdomains_$1.txt
rm 1.txt 2.txt 3.txt 
}
