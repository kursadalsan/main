#!/bin/bash

#!/bin/bash
sudo apt-get update

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"

# Install dependencies
sudo apt-get install -y python3 python3-pip python3-venv git curl unzip

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.20.1.linux-amd64.tar.gz
                    sudo tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

# Install subdomain script 

# Install subfinder
echo "Installing subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo cp ~/go/bin/subfinder /usr/local/bin/

# Install Sublist3r
echo "Installing Sublist3r..."
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
sudo cp sublist3r.py /usr/local/bin/sublist3r
cd ..

# Install amass
echo "Installing amass..."
go install -v github.com/OWASP/Amass/v3/...@latest
sudo cp ~/go/bin/amass /usr/local/bin/

# Install assetfinder
echo "Installing assetfinder..."
go install -v github.com/tomnomnom/assetfinder@latest
sudo cp ~/go/bin/assetfinder /usr/local/bin/

# Install findomain
echo "Installing findomain..."
wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
sudo mv findomain /usr/local/bin/

# Install crtsh
echo "Installing crtsh..."
pip3 install crtsh

# Install httprobe and httpx
echo "Installing httprobe..."
go install github.com/tomnomnom/httprobe@latest
sudo cp ~/go/bin/httprobe /usr/local/bin/

echo "Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp ~/go/bin/httpx /usr/local/bin/

echo "Installing gobuster..."
go install github.com/OJ/gobuster/v3@latest
sudo cp ~/go/bin/gobuster /usr/local/bin/

echo "Installing dirsearch..."
pip3 install dirsearch

# Install url script 

echo "Installing gau..."
go install github.com/lc/gau/v2/cmd/gau@latest
sudo cp ~/go/bin/gau /usr/local/bin/

echo "Installing katana..."
go install github.com/projectdiscovery/katana/cmd/katana@latest
sudo cp ~/go/bin/katana /usr/local/bin/

echo "Installing waymore..."
sudo apt install pipx
pipx ensurepath	
pipx install git+https://github.com/xnl-h4ck3r/waymore.git	
pipx ensurepath

echo "Installing wayback..."
go install github.com/tomnomnom/waybackurls@latest
sudo cp ~/go/bin/waybackurls /usr/local/bin/

# Install port scan

echo "Installing nmap..."
sudo apt install nmap

echo "Installing naabu..."
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
sudo cp ~/go/bin/naabu /usr/local/bin/

echo "Installing gf..."
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns
sudo cp ~/go/bin/gf /bin/
mkdir .gf
mv ~/Gf-Patterns/*.json ~/.gf

# extra tools

# install paramspider 
git clone https://github.com/0xKayala/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt