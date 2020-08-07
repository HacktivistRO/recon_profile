# Namaste 🙏
This repository contains my .bash_profile that has some user-defined functions for automating tasks using BASH

Prerequisites:
1) Assetfinder: https://github.com/tomnomnom/assetfinder
2) Gau: https://github.com/lc/gau
3) QSReplace: https://github.com/tomnomnom/qsreplace
4) SubFinder: https://github.com/projectdiscovery/subfinder

How-To

Run following commands to install the dependencies for .bash_profile

    sudo apt install -y golang-go
    go get -u github.com/tomnomnom/assetfinder
    GO111MODULE=on go get -u -v github.com/lc/gau
    go get -u github.com/tomnomnom/qsreplace
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

In terminal, run:

    git clone https://github.com/HacktivistRO/recon_profile/
    cd recon_profile
    cat .bash_profile >> ~/.bash_profile
    source ~/.bash_profile
    echo "source ~/.bash_profile" >> /root/.bashrc
    echo ".bash_profile has been set-up"
       
 ### OR
 
You can simply run this [script](https://github.com/HacktivistRO/HackBox/) and all the neccessary things will done automatically by this script.

About xss()
--

This command will find all subdomains (using AssetFinder) then all parameters will be fetched (using GAU) then hack\" will be replaced (using QSReplace) and in the response if something like hack\" is found (that means no input validation was done), and this is how you'll be shown URLs vulnerable to reflected XSS

To use xss(), you need to write
    
       xss <your-target-website-here>

such as

       xss leettime.net
 
<p align="center">
Happy Hacking!:heart:
</p>
