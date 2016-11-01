# Build examples of .ssh/config and /etc/tor/torrc
echo ""
CONNECTION="$(cat /var/lib/tor/ssh_onion_service/hostname)"
ONION="$(echo $CONNECTION | cut -d' ' -f1)"
echo "# Add this to your .ssh/config in client side"
echo "host hidden"
echo -e "\thostname $ONION"
echo -e "\tuser root"
echo -e "\tproxyCommand /usr/local/bin/ncat --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p"
echo ""
echo "Add this line to your /etc/tor/torrc on client side."
echo "HidServAuth $CONNECTION"
echo ""

