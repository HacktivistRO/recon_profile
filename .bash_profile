#Single command to find reflected XSS on any target
xss() 
{
assetfinder $1 -subs-only | gau | grep '=' | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'
}
# command to find unique live subdomains 
subdomains()
{
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF' > 1.txt
subfinder -d $1 -silent -recursive -all > 2.txt
cat 1.txt 2.txt | sort -u | httprobe -prefer-https > subdomains_$1.txt
rm 1.txt 2.txt 
}
