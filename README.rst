####
newsetup
####

.. image:: https://travis-ci.com/faiyaz7283/newsetup.svg?branch=develop

.. image:: /images/demo.gif?raw=true
   :alt: demo
   :align: center	 

About
====

This program is a simple script designed to handle a couple of trivial
tasks. Tasks that, for many use cases, mandatory to be performed. The script
helps setting up hostname and ssh keys quickly. A common use case is when
building a cluster of node servers. Once the ssh keys and proper hostnames are
there, each node can be accessed individually or in a group setting. To
orchestrate any repetitive tasks after that could be done much quicker, for
example, using ansible or similar tools.
	  
Backstory
====

While working on setting up a raspi cluster, I realized that I needed to
generate ssh keys from each node by logging into each manually. For easy access
within a local network, I also needed to set up the hostname for each. Since
this is a pretty trivial but tedious task to repeat in the future, I created
this script.

Quick usage:
====

Log into a node and setup a hostname and generate a 521 bits ecdsa ssh key.

- Run the script dynamically using:

  curl
   
  .. code-block:: bash

     newsetup="https://raw.githubusercontent.com/faiyaz7283/newsetup/develop/newsetup"

     # Test with dry-run
     bash <(curl -s "$newsetup") -k ecdsa --bits 521 -n machine01 --dry-run

     # Run the code
     bash <(curl -s "$newsetup") -k ecdsa --bits 521 -n machine01

  wget

  .. code-block:: bash

     newsetup="https://raw.githubusercontent.com/faiyaz7283/newsetup/develop/newsetup"

     # Test with dry-run
     bash <(wget -O- "$newsetup" -o /dev/null) -k ecdsa --bits 521 -n machine01 --dry-run

     # Run the code
     bash <(wget -O- "$newsetup" -o /dev/null) -k ecdsa --bits 521 -n machine01

- Download the script and run manually:

  .. code-block:: bash

     # download via curl
     curl https://raw.githubusercontent.com/faiyaz7283/newsetup/develop/newsetup -o newsetup
     # or wget
     wget https://raw.githubusercontent.com/faiyaz7283/newsetup/develop/newsetup
	  
     chmod +x newsetup
     
     # Test with dry-run
     ./newsetup -k ecdsa --bits 521 -n machine01 --dry-run

     # Run the code
     ./newsetup -k ecdsa --bits 521 -n machine01

General usage
====
     
Setup hostname with -n | --name flag
****

When running this on a linux machine, newsetup will use the `hostnamectl`_
program to setup hostname.

.. _hostnamectl: https://man7.org/linux/man-pages/man1/hostnamectl.1.html

.. image:: /images/linux_hostname.gif?raw=true
   :alt: hostname setup on linux machine.
   :align: center	 

And running on a macOS, it will use `scutil`_ program to setup hostname. Keep
in mind all three following names will be changed ComputerName, HostName and
LocalHostName.

.. _scutil: https://ss64.com/osx/scutil.html

.. image:: /images/osx_hostname.gif?raw=true
   :alt: hostname setup on osx machine.
   :align: center	 


Generate ssh-keys with -k | --keygen flag
****

Generating ssh keys with newsetup is fairly easy. Use the ``-k`` or ``--keygen``
flag with the following type dsa, ecdsa, ed25519 or rsa. By default, keys will
be stored in the ~/.ssh directory. To change the location use the ``--dir``
flag. There is also the ``--bits`` flag available to add bit size for a
particular key type. Check `ssh-keygen`_ manual for more info.

.. _ssh-keygen: https://www.man7.org/linux/man-pages/man1/ssh-keygen.1.html

.. image:: /images/ssh_key.gif?raw=true
   :alt: Generate a ssh key.
   :align: center	 

Get usage menu with -h | --help flag
****

For more information please check the usage menu. 

.. image:: /images/usage.gif?raw=true
   :alt: Print usage menu.
   :align: center	 

Contributing
====

Any contributions or suggestions for improvements are always
welcome. Please see `contributing`_ for more info.

.. _contributing: https://github.com/faiyaz7283/newsetup/blob/develop/CONTRIBUTING.rst

Issues
====
Please report issues, bugs, improvements on `issues page`_.

.. _issues page: https://github.com/faiyaz7283/newsetup/issues

License
====

This project is under the MIT `license`_.

.. _license: https://raw.githubusercontent.com/faiyaz7283/newsetup/develop/LICENSE
