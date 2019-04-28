
# chrony

Installs and configures chrony NTP client/server.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with chrony](#setup)
    * [What chrony affects](#what-chrony-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with chrony](#beginning-with-chrony)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module sets up the chrony NTP client/server on the system.

Module development has been based on chrony version 3.2 package on CentOS 7.

## Setup

### What chrony affects

* Installs chrony package(s).
* Sets up the chrony configuration file from provided data.
* Manages the chrony service.

### Setup Requirements

* puppetlabs/stdlib module.

### Beginning with chrony

To install and configure chrony as a client with default settings, simply define the class.

    class { 'chrony': }

## Usage

#### Installs and configures chrony as a client with default settings

    class { 'chrony': }

#### Installs and configures chrony with specified source servers

    class { 'chrony':
      servers => [
        { hostname => 'ntp1.mydomain.tld' },
        { hostname => 'ntp2.mydomain.tld' }
      ]
    }

#### Installs and configures chrony to serve time to clients on the 192.168.1.0/24 network.

    class { 'chrony':
      access_rules => [
        {
          access => 'allow',
          subnet => '192.168.1'
        }
      ]
    }

## Limitations

Tested on CentOS 7 only, but should work on any RHEL-clone without issues.

## Development

All bugreports, suggestions and patches will be considered.
