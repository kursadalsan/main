#!/bin/bash

#!/bin/bash
sudo apt-get update

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"

# Install dependencies
sudo apt-get install -y python3 python3-pip python3-venv git curl unzip


wget https://golang.org/dl/go1.22.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.profile
source ~/.profile
source ~/.bashrc

# Install subdomain script 

# Install subfinder
echo "Installing subfinder..."
echo export PATH=$PATH:$HOME/go/bin >> $home/.bashrc
source $home/.bashrc
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build
mv subfinder /usr/local/bin/

# Install Sublist3r
echo "Installing Sublist3r..."
echo "Installing waymore..."
sudo apt install -y pipx 
pipx ensurepath	
pipx install git+https://github.com/RoninNakomoto/Sublist3r2.git
pipx ensurepath

# Install amass
echo "Installing amass..."
go install -v github.com/owasp-amass/amass/v4/...@master
sudo cp ~/go/bin/amass /usr/bin/

# Install assetfinder
echo "Installing assetfinder..."
go install -v github.com/tomnomnom/assetfinder@latest
sudo cp ~/go/bin/assetfinder /usr/bin/

# Install findomain
echo "Installing findomain..."
wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
sudo mv findomain /usr/local/bin/

# Install crtsh
echo "Installing crtsh..."
git clone https://github.com/YashGoti/crtsh.py.git
cd crtsh.py
mv crtsh.py crtsh
chmod +x crtsh
cp crtsh /usr/bin/
cd ~

# Install httprobe and httpx
echo "Installing httprobe..."
go install github.com/tomnomnom/httprobe@latest
sudo cp ~/go/bin/httprobe /usr/bin/

echo "Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp ~/go/bin/httpx /usr/bin/

echo "Installing gobuster..."
go install github.com/OJ/gobuster/v3@latest
sudo cp ~/go/bin/gobuster /usr/bin/

echo "Installing dirsearch..."
pipx install git+https://github.com/maurosoria/dirsearch.git

# Install url script 

echo "Installing gau..."
go install github.com/lc/gau/v2/cmd/gau@latest
sudo cp ~/go/bin/gau /usr/local/bin/

echo "Installing katana..."
go install github.com/projectdiscovery/katana/cmd/katana@latest
sudo cp ~/go/bin/katana /usr/local/bin/

pipx install git+https://github.com/xnl-h4ck3r/waymore.git	

echo "Installing wayback..."
go install github.com/tomnomnom/waybackurls@latest
sudo cp ~/go/bin/waybackurls /usr/local/bin/

# Install port scan

echo "Installing nmap..."
sudo apt install nmap

echo "Installing naabu..."
apt install libpcap-dev -y
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sudo cp ~/go/bin/naabu /usr/bin/

echo "Installing gf..."
go install github.com/tomnomnom/gf@latest
sudo cp go/bin/gf /bin/
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir .gf
mv ~/Gf-Patterns/*.json ~/.gf

# extra tools

# install paramspider 
pipx install git+https://github.com/devanshbatham/ParamSpider.git
pipx ensurepath