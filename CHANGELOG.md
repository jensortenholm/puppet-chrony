# Changelog

All notable changes to this project will be documented in this file.

## Release 0.5.0

* Litmus acceptance tests.
* Tested with Puppet 7-series.
* Updated supported OS list.

## Release 0.4.1

Merged pull requests:

* Do not enable and start chrony when running under a lxd, lxc or openvz container [\#1](https://github.com/jensortenholm/puppet-chrony/pull/1) ([jflandry](https://github.com/jflandry))

## Release 0.4.0

**Features**

* Added support and new parameters for CentOS 8.

## Release 0.3.0

**Features**

* Added support for SLES 15.
* Chrony keyfile can now be managed by providing a list to the 'keys' parameter.
* Updated documentation and examples.

## Release 0.2.0

**Features**

* Added support for Debian 9.
* Added support for Ubuntu 18.04.
* Added support for Fedora 29.
* Added validation for incompatible combinations of parameters.
* Improved documentation.

## Release 0.1.1

**Bugfixes**

* Added missing metadata.

## Release 0.1.0

**Features**

* First implementation.
