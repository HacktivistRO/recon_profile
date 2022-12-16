# Namaste 🙏
This repository contains my .bash_profile that has some user-defined functions for automating tasks using BASH

Prerequisites
--
1) Go Language 
2) GAU: https://github.com/lc/gau
3) QSReplace: https://github.com/tomnomnom/qsreplace
4) SubFinder: https://github.com/projectdiscovery/subfinder
5) CSPRecon: https://github.com/edoardottt/csprecon
6) Cero: https://github.com/glebarez/cero
7) Amass: https://github.com/OWASP/Amass

How-To
--

Run following commands to install the dependencies for .bash_profile

For installing Go Language

    wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
    sudo tar -xvf go1.13.4.linux-amd64.tar.gz
    sudo mv go /usr/local
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
    echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
    source ~/.bash_profile
    
For installing required tools
    
    GO111MODULE=on go get -u -v github.com/lc/gau
    go get -u github.com/tomnomnom/qsreplace
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
    go install github.com/edoardottt/csprecon/cmd/csprecon@latest
    go install github.com/glebarez/cero@latest
    

After all the requirements have been satisfied, run:

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

This command will find all subdomains (using subdomains()) then all parameters will be fetched (using GAU) then hack\" will be replaced (using QSReplace) and in the response if something like hack\" is found (that means no input validation was done), and this is how you'll be shown URLs vulnerable to reflected XSS

To use xss(), you need to write
    
    xss <your-target-website-here>

such as

    xss leettime.net
 
<p align="center">
Happy Hacking!:heart:
</p>
