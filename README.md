# Namaste 🙏
This repository contains my .bash_profile that has some user-defined functions for automating tasks using BASH

Prerequisites:
1) Assetfinder: https://github.com/tomnomnom/assetfinder
2) Gau: https://github.com/lc/gau
3) QSReplace: https://github.com/tomnomnom/qsreplace
4) SubFinder: https://github.com/projectdiscovery/subfinder

How-To

1) Run following commands to install the dependencies for .bash_profile
           
       sudo apt install -y golang-go

       go get -u github.com/tomnomnom/assetfinder
 
       GO111MODULE=on go get -u -v github.com/lc/gau
  
       go get -u github.com/tomnomnom/qsreplace
      
       GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
       
2) In your linux machine, using your favourite text editor, open /root/.bash_profile like 

       mousepad /root/.bash_profile
       
3) Copy contents of .bash_profile (of this repository) to  your .bash_profile file
4) Save the file and close text editor 
5) In terminal, run:

       source /root/.bash_profile
 
       echo "source /root/.bash_profile" >> /root/.bashrc

About xss()
--

This command will find all subdomains (using AssetFinder) then all parameters will be fetched (using GAU) then hack\" will be replaced (using QSReplace) and in the response if something like hack\" is found (that means no input validation was done), and this is how you'll be shown URLs vulnerable to reflected XSS

To use xss(), you need to write
    
    xss <your-target-website-here>

such as

    xss leettime.net
 
 ### OR
 
You can simply run this [script](https://github.com/HacktivistRO/HackBox/) and all the neccessary things will done automatically by this script.
<p align="center">
Happy Hacking!:heart:
</p>


