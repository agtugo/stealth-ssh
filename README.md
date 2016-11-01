Stealth SSH server using onion service
======================================

This fork is intended to work out of the box for ethos distro, but with minimum configuration it should work for all linux based systems.
======================================
Tor onion service for your SSH server with password protected onion address.

This onion service cannot be port scanned.
Does not allow anyone else to connect or fingerprint your SSH server.
Hence no risk of exposing your onion address <=> real IP address because SSH fingerprint matching.

Prerequisites windows:
- Cygwin with ssh
- Netcat (do not forget to add it to environment variables)
- Tor
- Torrc file (from here https://svn.torproject.org/svn/tor/tags/tor-0_0_9_5/src/config/torrc.sample.in (or newer) 
 and paste it to C:\Users\----your user here----\AppData\Roaming\tor\torrc


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






