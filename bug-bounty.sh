#!/bin/bash

# See README.md on the tools that are used and how to setup and run the script on your system.

# Updates the system
sudo apt-get update

# Installs GO - required for some of the tools to be installed
echo "Installing GO..."
sudo apt-get install golang-go -y
echo "GoLang installed"
echo "Modifying .profile to support GO installations..."
echo "export GOPATH=$(go env GOPATH) \n export PATH=$PATH:$GOPATH/bin" >> .profile
echo "GO successfully installed"

# Installs the tools
echo "Installing Nuclei..."
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "Nuclei installed, installing httpx..."
go get -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "httpx installed, installing subfinder..."
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Subfinder installed, installing DNSx..."
go get -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "DNSx installed, installing Naabu..."
go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "Naabu installed"
echo "Installing Recox"
git clone https://github.com/samhaxr/recox
cd recox
chmod +x recox.sh
./recox.sh
mv recox.sh /usr/lcoal/bin/recox
echo "Recox successfully installed, please add your VirusTotal and Shodan API keys to /usr/lcoal/bin/recox.sh"
sleep 5