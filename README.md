[![Build Status](https://travis-ci.org/juju4/ansible-nrpeclient.svg?branch=master)](https://travis-ci.org/juju4/ansible-nrpeclient)
# NRPE ansible role

A simple ansible role to setup nrpe daemon for remote monitoring.
You can use it also to remove configuration.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7
Targeted for Linux and Darwin

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.nrpeclient
```

## Variables

```
#nrpeclient_type: nagios
nrpeclient_type: icinga2
nrpeclient_server: ansible_fqdn_servername

## if needed for icinga2 satellite/hosts
#nrpeclient_if: eth0

## define to true if you are on the server itself so we are using localhost
#nrpeclient_useloopback: false

## / can be a catchall so better to put device
##  Ensure it is defined in local-nrpe.cfg
nrpeclient_partitionroot: sda1
nrpeclient_partitionboot: sda2
## for icinga2
#nrpeclient_group: Group1
#nrpeclient_checkcommand: hostalive
#nrpeclient_checkcommand: tcp

## snmp community
nrpeclient_snmpcommunity: public

## nrpe bind restriction (only accept one IP)
#nrpeclient_nrpebind: '192.168.250.10'
## nrpe allowed hosts
nrpeclient_nrpeserver: '192.168.0.1'

nrpeclient_add_to_etchosts: true

monitor_ntp: true
monitor_mailq_postfix: true
monitor_sensors: false

## to remove server configuration only (use 'gather_facts: False' to avoid online check)
#nrpeclient_remove: true
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju4.nrpeclient
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/juju4.nrpeclient/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* ```repomd.xml does not match metalink for epel``` on Centos/Redhat
uncomment baselist and comment mirrorlist in /etc/yum.repos.d/epel.repo
(http://stackoverflow.com/questions/30949707/centos-6-6-errno-1-repomd-xml-does-not-match-metalink-for-updates-when-tryin)


## License

BSD 2-clause

