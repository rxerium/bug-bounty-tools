#!/bin/bash

# See README.md on the tools that are used and how to setup and run the script on your system.
# I will try and make as many comments as possible so it is easy to understand the commands that are being ran


# Updates the system
sudo apt-get update && sudo apt-get upgrade -y

# Checks to see if GO is installed and installs if not - required for some of the tools to be installed
if ! command -v go &> /dev/null; then
  # Install Go
  sudo apt-get install golang-go -y
fi

echo "Modifying '.profile' to support GO installations..."
echo -e 'export GOPATH=$(go env GOPATH) \nexport PATH=$PATH:$GOPATH/bin' >> .profile
source ~/.profile
echo "GO successfully installed"

# Check if snap is installed (required for Amass)
if ! command -v snap &> /dev/null
then
    echo "snap is not installed. Installing snap..."
    sudo apt-get install snapd
else
    echo "snap is already installed."
fi

# Checks to see if Python3 is installed for SQLmap
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get install python3
else
    echo "Python3 is already installed."
fi

# Installs the tools mentioned in README.md
echo "Installing all the tools now..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sudo apt-get install nmap -y
sudo snap install amass
sudo apt install wfuzz -y
cd ~ && git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
go install github.com/projectdiscovery/katana/cmd/katana@latest
git clone https://github.com/samhaxr/recox
cd recox
chmod +x recox.sh
./recox.sh
sudo mv recox.sh /usr/local/bin/recox
echo "Recox successfully installed, please add your VirusTotal and Shodan API keys to /usr/lcoal/bin/recox.sh"
echo "All tools have now been installed."