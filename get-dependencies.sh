#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

#[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.nrpeclient ] && ln -s ansible-nrpeclient $rolesdir/juju4.nrpeclient
[ ! -e $rolesdir/juju4.nrpeclient ] && cp -R $rolesdir/ansible-nrpeclient $rolesdir/juju4.nrpeclient

## don't stop build on this script return code
true
