#!/bin/bash

# Install Tor
apt update 
apt install tor

# Create hidden service folder
mkdir -p /var/lib/tor/ssh_onion_service/

#line from the original repository I still do not understand the utility of this command
chown -R debian-tor:debian-tor /var/lib/tor/ssh_onion_service/
chmod 0700 /var/lib/tor/ssh_onion_service/

# Add settings for SSH connection
echo "" >> /etc/tor/torrc
echo "#Hidden service for SSH connections." >> /etc/tor/torrc
echo "HiddenServiceDir /var/lib/tor/ssh_onion_service/" >> /etc/tor/torrc
# Create authentication token
AUTH="$(< /dev/urandom tr -dc a-z0-9 | head -c16)"
echo "HiddenServiceAuthorizeClient stealth $AUTH" >> /etc/tor/torrc
#only if you want to change ports
#echo "HiddenServicePort 22 127.0.0.1:51984" >> /etc/tor/torrc
echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc
sudo /etc/init.d/tor restart

#only if you want to change ports
#sed -i 's/Port 22/Port 51984/g' /etc/ssh/sshd_config
restart ssh

# Build examples of .ssh/config and /etc/tor/torrc
echo "Configuration for LINUX"
echo ""
CONNECTION="$(cat /var/lib/tor/ssh_onion_service/hostname)"
ONION="$(echo $CONNECTION | cut -d' ' -f1)"
echo "# Add this to your .ssh/config in client side"
echo "host rigxx"
echo -e "\thostname $ONION"
echo -e "\tuser ethos"
echo -e "\tproxyCommand /usr/local/bin/ncat --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p"
echo ""
echo "Add this line to your /etc/tor/torrc on client side."
echo "HidServAuth $CONNECTION"
echo ""

echo "Configuration for Windows"
echo ""
CONNECTION="$(cat /var/lib/tor/ssh_onion_service/hostname)"
ONION="$(echo $CONNECTION | cut -d' ' -f1)"
echo "# Add this to your .ssh/config in client side"
echo "host rigxx"
echo -e "\thostname $ONION"
echo -e "\tuser ethos"
echo -e "\tproxyCommand ncat --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p"
echo ""
echo "Add this line to your /etc/tor/torrc on client side."
echo "HidServAuth $CONNECTION"
echo ""
