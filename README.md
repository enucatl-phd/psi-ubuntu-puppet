Configure Ubuntu for psi.ch with puppet
=======================================

Install
-------

```bash
sudo apt-get install git puppet
git clone https://github.com/Enucatl/psi-ubuntu-puppet.git
cd psi-ubuntu-puppet
sudo puppet apply --modulepath=./modules ubuntu-config.pp
```

What does it do to my computer?
-------------------------------

It uses [puppet](http://puppetlabs.com/) to configure your computer
according to the settings specified in the
[ubuntu-config.pp](ubuntu-config.pp) file:

* install the libpam-krb5, openafs-client, openafs-krb5, kstart, libpam-afs-session and ntp packages
* configure the ntp server address
* configure the cups server address (warning: printing only works with lp or acroread)
* configure the afs client
* restart the services

It does not set your home to the afs home /afs/psi.ch/user/u/username
because I don't like to do that.

Puppet is _idempotent_, that is running the command twice just makes sure
that the current configuration matches the requirements, but nothing else
will happen.
