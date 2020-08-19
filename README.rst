####
newsetup
####

.. image:: https://travis-ci.com/faiyaz7283/newsetup.svg?branch=develop

.. image:: /img/demo.gif?raw=true
   :alt: demo
   :align: center	 

::

  usage:
   newsetup [ -h | --help ] [ -k | --keygen <type> ]
            [ --bits <bits> ] [ -n | --name <name> ]
            [ -q | --quiet ] [ -v | --verbose ]
            [ --dry-run ]
  
  descriptions:
   A script for generating ssh key and setting up a hostname.
  
  options:
   -h, --help             Show this usage menu.
   -k, --keygen    <type> Generate ssh keys. Types: dsa, ecdsa, ed25519 or rsa.
                          Key will be generated in ~/.ssh dir, with empty passphrase.
       --dir       <dir>  Directory to store generated ssh keys. Default is ~/.ssh.
       --bits      <bits> Optional: Specify <bits> for rsa or ecdsa keys.
                          See examples section below for more details.
   -n, --name      <name> Setup a hostname.
   -q, --quiet            Silence all output.
   -v, --verbose          Increase verbosity. Max allowed 4.
       --debug            Turn on debug mode.
       --dry-run          Dry-run mode.
  
  examples:
   Generate ssh key of type dsa, ecdsa, ed25519 or rsa.
     # Create rsa key.
     ./newsetup -k rsa
  
     # Create ecdsa key and specify a bit size.
     ./newsetup --keygen ecdsa --bits 521
  
     # Create dsa key.
     ./newsetup -k dsa
  
   Setup hostname.
     # Using short form.
     ./newsetup -n new_hostname
  
     # Using long form.
     ./newsetup --name new_hostname
  
   Practical use-case.
     # Generate an ecdsa key with 521 bits and setup a hostname.
     ./newsetup -k ecdsa --bits 521 -n some_server
