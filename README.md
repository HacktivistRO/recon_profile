Prerequisites:
1) Assetfinder: https://github.com/tomnomnom/assetfinder
2) Gau: https://github.com/lc/gau
3) QSReplace: https://github.com/tomnomnom/qsreplace
4) SubFinder: https://github.com/projectdiscovery/subfinder

How-To

1) In your linux machine, using your favourite text editor, open /root/.bash_profile (like mousepad /root/.bash_profile)
2) Copy contents of .bash_profile (of this repository) to  your .bash_profile file
3) Save the file and close text editor 
4) In terminal run: source /root/.bash_profile
5) Run following commands to install the the dependencies for .bash_profile
 - sudo apt install golang-go
 - go get -u github.com/tomnomnom/assetfinder
 - GO111MODULE=on go get -u -v github.com/lc/gau
 - go get -u github.com/tomnomnom/qsreplace
 - GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

GOOD TO GO! 
                  Happy Hacking ;)
