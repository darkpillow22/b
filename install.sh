echo -e "\n\n\033[91m
█▀▀ █▀█ █▄ █ █▀▀ █░█ █▀ █▀▀ █▀▄   █▀▀ █ █ ▄▀█ █▀█ ▄▀█ █▀▀ ▀█▀ █▀▀ █▀█
█▄▄ █▄█ █░▀█ █▀░ █▄█ ▄█ ██▄ █▄▀   █▄▄ █▀█ █▀█ █▀▄ █▀█ █▄▄  █░ ██▄ █▀▄\n\n\033[0m"
sleep 2
sudo apt update
sudo apt upgrade -y
sudo apt install curl -y
curl -LO https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/AdGuardHome_linux_amd64.tar.gz
curl -LO https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/checksums.txt
sha256sum -c checksums.txt --ignore-missing
tar -vxf AdGuardHome_linux_amd64.tar.gz
sudo mkdir /opt/AdGuardHome
sudo mv ~/AdGuardHome/AdGuardHome /opt/AdGuardHome/
sudo chown -R root:root /opt/AdGuardHome
sudo chmod -R o-rwx /opt/AdGuardHome
sudo apt install acl
sudo setfacl -d -m o::--- /opt/AdGuardHome
sudo /opt/AdGuardHome/AdGuardHome -s install
sudo ufw allow 3000/tcp
sudo ufw reload
echo "instalation compeleted. Adguard URL: server_ipv4:3000"
rm install.sh
rm AdGuardHome_linux_amd64.tar.gz
