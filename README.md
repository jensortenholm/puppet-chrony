
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

Module development has been based on chrony versions 3.2 - 3.5.

## Setup

### What chrony affects

* Installs chrony package(s).
* Sets up the chrony configuration file from provided data, or using OS default data bundled with module.
* Sets up the chrony keyfile from provided data.
* Manages the chrony service.

### Setup Requirements

* Supported OS with chrony package available in a configured package repository.
* puppetlabs/stdlib module.

### Beginning with chrony

To install and configure chrony as a client with OS default settings, simply define the class.

    class { 'chrony': }

## Usage

#### Installs and configures chrony as a client with default settings

    class { 'chrony': }

#### Installs and configures chrony with customized source servers

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

#### Example using three pool.ntp.org servers as sources, while serving time to the 192.168.0.0/16 network - except for 192.168.2.0/24.

    class { 'chrony':
      servers      => [
        {
          hostname => '0.pool.ntp.org',
          iburst   => true,
        },
        {
          hostname => '1.pool.ntp.org',
          iburst   => true,
        },
        {
          hostname => '2.pool.ntp.org',
          iburst   => true,
        },
      ],
      access_rules => [
        {
          access => 'deny',
          subnet => '192.168.2.',
        },
        {
          access => 'allow',
          subnet => '192.168.',
        }
      ],
    }

#### Previous example repeated, but with data provided through hiera.

    chrony::servers:
      - hostname: '0.pool.ntp.org'
        iburst:   true
      - hostname: '1.pool.ntp.org'
        iburst:   true
      - hostname: '2.pool.ntp.org'
        iburst:   true
    chrony::access_rules:
      - access: 'deny'
        subnet: '192.168.2.'
      - access: 'allow'
        subnet: '192.168.'

    include chrony

#### Example as a client but using a key for authentication

    class { 'chrony':
      servers => [
        {
          hostname => 'ntp1.mydomain.tld',
          key      => 5,
        }
      ],
      keys    => [
        {
          id      => 5,
          hashalg => 'SHA1',
          hash    => 'HEX:EC56E6FC27CD0C9B5E6B867DD53F137985279B48',
        }
      ],
    }

## Limitations

Tested on CentOS 7 and 8, Debian 9, Fedora 29, SLES 15 and Ubuntu 18.04.

## Development

All bugreports, suggestions and patches will be considered.
