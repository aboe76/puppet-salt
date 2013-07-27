#puppet-salt

[![Build Status](https://secure.travis-ci.org/aboe76/puppet-salt.png?branch=master)](http://travis-ci.org/aboe76/puppet-salt)


####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with salt](#setup)
    * [What salt affects](#what-salt-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with salt](#beginning-with-salt)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)


# salt Puppet Module Arch Linux

Manage salt client and server via Puppet.

```
include salt
```

Will install Both client and server.



##Module Description

This module can be used to install a single salt master/minion or
both on one machine.

##Setup

###What salt affects

 * salt master/minion package.
 * salt master/minion configuration files.
 * salt master/minion service.
 
###Beginning with salt

include '::salt' is all you need to get it running.
Or put this in your manifest:


```puppet
class { '::salt':}
```

##Usage

All interaction with the salt module can be done through
the main salt class.

###I just want salt, what's the minimum I need?

```puppet
include '::salt'
```

###I just want a salt minion?

```puppet
include '::salt::minion'
```

###I just want a salt master?

this will install a salt master and a minion for itself.

```puppet
include '::salt'
```

##Reference

###Classes
 * salt: Main class, includes all the rest.
 * salt::minion: Handles the minion.
 * salt::master: Handles the master
 * salt::params: all parameters needed for the rest.

###Parameters

The following parameters are available in the chrony module

####`minion_config`

This sets the file to write minion configuration into.

####`master_config`

This sets the file to write salt master configuration into.

####`minion_package_name`

This determines the name of the package to install.

####`master_package_name`

This determines the name of the package to install.

####`minion_service_name`

This selects the name of the salt minion service for puppet to manage.

####`master_service_name`

This selects the name of the salt minion service for puppet to manage.

##Limitations

This module has been built on and tested against Puppet 3.2.3 and higher.

The module has been tested on:
 * Arch Linux with own build (split packages)