#!/bin/bash

#Single command to find reflected XSS on any target
xss() 
{
Finding reflected XSS on: $1"
printf $1 | gau | grep '=' | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'
}
# command to find unique live subdomains 
subdomains()
{
echo "Automation script for subdomain enumeration has now been released as a tool. Here's the link to the tool: https://github.com/HacktivistRO/SubSleuth/. You can perform subdomain enumeration for $1 using SubSleuth"
}
