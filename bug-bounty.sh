#!/bin/bash

# See README.md on the tools that are used and how to setup and run the script on your system.
# I will try and make as many comments as possible so it is easy to understand the commands that are being ran


# Updates the system
sudo apt-get update && sudo apt-get upgrade -y

# Installs GO - required for some of the tools to be installed
echo "Installing GO..."
sudo apt-get install golang-go -y
echo "GoLang installed"
echo "Modifying '.profile' to support GO installations..."
echo "export GOPATH=$(go env GOPATH) \n export PATH=$PATH:$GOPATH/bin" >> .profile
echo "GO successfully installed"

# Installs the tools mentioned in README.md
echo "Installing Nuclei..."
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "Nuclei installed, installing httpx..."
go get -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "httpx installed, installing Subfinder..."
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Subfinder installed, installing DNSx..."
go get -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "DNSx installed, installing Naabu..."
go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "Naabu installed, installing Katana"
go install github.com/projectdiscovery/katana/cmd/katana@latest
echo "Katana installed, installing Recox"
git clone https://github.com/samhaxr/recox
cd recox
chmod +x recox.sh
./recox.sh
mv recox.sh /usr/lcoal/bin/recox
echo "Recox successfully installed, please add your VirusTotal and Shodan API keys to /usr/lcoal/bin/recox.sh"
echo "All tools have now been installed."