Stealth SSH server using onion service
======================================

Tor onion service for your SSH server with password protected onion address.

This onion service cannot be port scanned.
Does not allow anyone else to connect or fingerprint your SSH server.
Hence no risk of exposing your onion address <=> real IP address because SSH fingerprint matching.

You should read the autoconfigure.sh and execute the lines by hand.

- Install Tor
- Create a hidden service
- Add HiddenServiceAuthorizeClient stealth SOMEPASS
- HiddenServicePort 22 127.0.0.1:22 # Last is your current SSH port
- service tor restart
- On client side create .ssh/config
- On client side add HidServAuth settings to /etc/tor/torrc


This is autoconfigurate script.
I still recommend to read it and make the changes manually. Sometimes it does not create the onion hostname just reboot and you will have everything to go, you can check the client side instructions with client_onion_conf.sh

```sh
$ sudo bash autoconfigure.sh
```
Similar to autoconfigure.sh but it just show what you need to add in the client side

```sh
$ sudo client_onion_conf.sh
```
For windows you need to install cygwin with ssh, netcat is not in cygwin you need to install it and then add it to the enviroment variables. With linux it is straightforward.







