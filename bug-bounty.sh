# Installs a set of tools for Bug Bounty testing
# Nuclei, httpx, dnsx, naabu, subfinder, recox

#!/bin/bash
sudo apt-get update
echo "Installing GOlang..."
sudo apt-get install golang-go -y
sleep 1
echo "GoLang installed"
sleep 2
echo "Modifying .profile to support GO installations..."
sleep 1
echo "export GOPATH=$(go env GOPATH) \n export PATH=$PATH:$GOPATH/bin" >> .profile
echo "System profile successfully updated"
sleep 2
echo "Installing Nuclei..."
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "Nuclei installed, installing httpx..."
sleep 2
go get -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "httpx installed, installing subfinder..."
sleep 2
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Subfinder installed, installing DNSx..."
sleep 2
go get -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "DNSx installed, installing Naabu..."
sleep 2
go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "Naabu installed"
sleep 3
echo "Installing Recox"
git clone https://github.com/samhaxr/recox
cd recox
chmod +x recox.sh
./recox.sh
mv recox.sh /usr/lcoal/bin/recox
echo "Recox successfully installed, please add your VirusTotal and Shodan API keys to /usr/lcoal/bin/recox.sh"
sleep 5