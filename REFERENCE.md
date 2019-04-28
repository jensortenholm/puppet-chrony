# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`chrony`](#chrony): Installs and configures the chrony NTP daemon.

## Classes

### chrony

Installs and configures the chrony NTP daemon.

#### Examples

##### Installs and configures chrony with default settings

```puppet
class { 'chrony': }
```

##### Installs and configures chrony with specified source servers

```puppet
class { 'chrony':
  servers => [
    { hostname => 'ntp1.mydomain.tld' },
    { hostname => 'ntp2.mydomain.tld' }
  ]
}
```

##### Installs and configures chrony to serve time to clients on the 192.168.1.0/24 network.

```puppet
class { 'chrony':
  access_rules => [
    {
      access => 'allow',
      subnet => '192.168.1'
    }
  ]
}
```

#### Parameters

The following parameters are available in the `chrony` class.

##### `package_ensure`

Data type: `Enum['absent', 'present']`

What state to ensure the chrony package is in. Default value: 'present'.

##### `service_ensure`

Data type: `Stdlib::Ensure::Service`

What state to ensure the chrony service is in. Default value: 'running'.

##### `service_enable`

Data type: `Boolean`

Whether or not the chrony service should be automatically started on system boot. Default value: true.

##### `config`

Data type: `Stdlib::Absolutepath`

The complete path to the chrony configuration file.

##### `package`

Data type: `String`

Name of the chrony package to install.

##### `service`

Data type: `String`

Name of the chrony service on the system.

##### `servers`

Data type: `Optional[Array[Struct[{
    hostname         => String,
    iburst           => Optional[Boolean],
    offline          => Optional[Boolean],
    auto_offline     => Optional[Boolean],
    prefer           => Optional[Boolean],
    noselect         => Optional[Boolean],
    trust            => Optional[Boolean],
    require          => Optional[Boolean],
    xleave           => Optional[Boolean],
    minpoll          => Optional[Integer[-4, 24]],
    maxpoll          => Optional[Integer[0, 24]],
    key              => Optional[Integer],
    maxdelay         => Optional[Variant[Float[0.0, 1000],Integer[0, 1000]]],
    maxdelayratio    => Optional[Variant[Float,Integer]],
    maxdelaydevratio => Optional[Variant[Float,Integer]],
    mindelay         => Optional[Variant[Float,Integer]],
    asymmetry        => Optional[Variant[Float,Integer]],
    offset           => Optional[Variant[Float,Integer]],
    minsamples       => Optional[Integer],
    maxsamples       => Optional[Integer],
    polltarget       => Optional[Integer[6, 60]],
    port             => Optional[Stdlib::Port],
    presend          => Optional[Integer],
    minstratum       => Optional[Integer],
    version          => Optional[Integer],
  }]]]`

Array of NTP servers to configure as sources.

##### `peers`

Data type: `Optional[Array[Struct[{
    hostname         => String,
    iburst           => Optional[Boolean],
    offline          => Optional[Boolean],
    auto_offline     => Optional[Boolean],
    prefer           => Optional[Boolean],
    noselect         => Optional[Boolean],
    trust            => Optional[Boolean],
    require          => Optional[Boolean],
    xleave           => Optional[Boolean],
    minpoll          => Optional[Integer[-4, 24]],
    maxpoll          => Optional[Integer[0, 24]],
    key              => Optional[Integer],
    maxdelay         => Optional[Variant[Float[0.0, 1000],Integer[0, 1000]]],
    maxdelayratio    => Optional[Variant[Float,Integer]],
    maxdelaydevratio => Optional[Variant[Float,Integer]],
    mindelay         => Optional[Variant[Float,Integer]],
    asymmetry        => Optional[Variant[Float,Integer]],
    offset           => Optional[Variant[Float,Integer]],
    minsamples       => Optional[Integer],
    maxsamples       => Optional[Integer],
    polltarget       => Optional[Integer[6, 60]],
    port             => Optional[Stdlib::Port],
    presend          => Optional[Integer],
    minstratum       => Optional[Integer],
    version          => Optional[Integer],
  }]]]`

Array of NTP servers to configure as peers.

##### `pools`

Data type: `Optional[Array[Struct[{
    hostname         => String,
    iburst           => Optional[Boolean],
    offline          => Optional[Boolean],
    auto_offline     => Optional[Boolean],
    prefer           => Optional[Boolean],
    noselect         => Optional[Boolean],
    trust            => Optional[Boolean],
    require          => Optional[Boolean],
    xleave           => Optional[Boolean],
    minpoll          => Optional[Integer[-4, 24]],
    maxpoll          => Optional[Integer[0, 24]],
    key              => Optional[Integer],
    maxdelay         => Optional[Variant[Float[0.0, 1000],Integer[0, 1000]]],
    maxdelayratio    => Optional[Variant[Float,Integer]],
    maxdelaydevratio => Optional[Variant[Float,Integer]],
    mindelay         => Optional[Variant[Float,Integer]],
    asymmetry        => Optional[Variant[Float,Integer]],
    offset           => Optional[Variant[Float,Integer]],
    minsamples       => Optional[Integer],
    maxsamples       => Optional[Integer],
    polltarget       => Optional[Integer[6, 60]],
    port             => Optional[Stdlib::Port],
    presend          => Optional[Integer],
    minstratum       => Optional[Integer],
    version          => Optional[Integer],
    maxsources       => Optional[Integer],
  }]]]`

Array of NTP server pools to configure.

##### `initstepslews`

Data type: `Optional[Array[Struct[{
    hostnames => Array[String],
    threshold => Integer,
  }]]]`

Array of initstepslew threshold configurations. See chrony.conf man-page for details of use.

##### `refclocks`

Data type: `Optional[Array[Struct[{
    driver         => Enum['PPS', 'SHM', 'SOCK', 'PHC'],
    param          => String,
    driver_options => Optional[Hash],
    poll           => Optional[Integer],
    dpoll          => Optional[Integer],
    refid          => Optional[String],
    lock           => Optional[String],
    rate           => Optional[Integer],
    maxlockage     => Optional[Integer],
    width          => Optional[Integer],
    pps            => Optional[Boolean],
    offset         => Optional[Variant[Float,Integer]],
    delay          => Optional[String],
    precision      => Optional[Integer],
    maxdispersion  => Optional[Integer],
    filter         => Optional[Integer],
    prefer         => Optional[Boolean],
    noselect       => Optional[Boolean],
    trust          => Optional[Boolean],
    require        => Optional[Boolean],
    minsamples     => Optional[Integer],
    maxsamples     => Optional[Integer],
  }]]]`

Array of reference clock configurations.

##### `manual`

Data type: `Optional[Boolean]`

Toggles support for the settime command in chronyc. Default value: false.

##### `acquisitionport`

Data type: `Optional[Stdlib::Port]`

Configures the source port number to use in outgoing requests.

##### `bindacqaddress`

Data type: `Optional[Stdlib::IP::Address]`

Sets the source network interface which chrony uses for outgoing requests.

##### `dumpdir`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the directory where measurement histories are saved.

##### `maxsamples`

Data type: `Optional[Integer[0,64]]`

Sets the default max number of samples that chrony should keep for each source.

##### `minsamples`

Data type: `Optional[Integer[0,64]]`

Sets the default min number of samples that chrony should keep for each source.

##### `combinelimit`

Data type: `Optional[Integer]`

Limits which sources are included in the combining algorithm. See chrony.conf man-page for details of use.

##### `maxdistance`

Data type: `Optional[Integer]`

Sets the maximum allowed distance to root for the sources to be considered by the source selection algorithm.

##### `maxjitter`

Data type: `Optional[Integer]`

Sets the maximum allowed amount of jitter for the sources to be considered by the source selection algorithm.

##### `minsources`

Data type: `Optional[Integer]`

Sets the minimum number of sources that needs to be available for selection before the local clock is updated.

##### `reselectdist`

Data type: `Optional[Integer]`

Sets the reselect distance. See chrony.conf man-page for details of use.

##### `stratumweight`

Data type: `Optional[Variant[Float,Integer]]`

Sets the amount of distance that should be added per stratum when selecting a source.

##### `corrtimeratio`

Data type: `Optional[Integer]`

Sets the corrtimeratio. See chrony.conf man-page for details of use.

##### `driftfile`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the chrony driftfile.

##### `fallbackdrift`

Data type: `Optional[Tuple[Integer, Integer]]`

Sets the fallbackdrift. See chrony.conf man-page for details of use.

##### `leapsecmode`

Data type: `Optional[Enum['system', 'step', 'slew', 'ignore']]`

Configures the method used to correct for leap seconds.

##### `leapsectz`

Data type: `Optional[String]`

Set the name of the timezone to use for determining when leap seconds occur.

##### `makestep`

Data type: `Optional[Tuple[Variant[Float,Integer], Variant[Float, Integer]]]`

Configures under which circumstances chrony will step the system clock.

##### `maxchange`

Data type: `Optional[Tuple[Integer, Integer, Integer]]`

Sets the maximum allowed offset corrected on a clock update.

##### `maxclockerror`

Data type: `Optional[Variant[Float,Integer]]`

Sets the maxclockerror. See chrony.conf man-page for details of use.

##### `maxdrift`

Data type: `Optional[Variant[Float,Integer]]`

Sets the maximum assumed drift of the system clock.

##### `maxupdateskew`

Data type: `Optional[Variant[Float,Integer]]`

Sets the maxupdateskew. See chrony.conf man-page for details of use.

##### `maxslewrate`

Data type: `Optional[Variant[Float,Integer]]`

Sets the maximum rate at which chrony is allowed to slew the time.

##### `tempcomp`

Data type: `Optional[Hash]`

Configures temperature compensation. See chrony.conf man-page for details of use.

##### `access_rules`

Data type: `Optional[Array[Struct[{
    access => Enum['allow', 'deny'],
    all    => Optional[Boolean],
    subnet => Optional[String],
  }]]]`

Ordered array of chrony NTP-server access rules.

##### `bindaddress_v4`

Data type: `Optional[Stdlib::IP::Address::V4]`

IPv4 address on the system that chrony should bind to for offering NTP service.

##### `bindaddress_v6`

Data type: `Optional[Stdlib::IP::Address::V6]`

IPv6 address on the system that chrony should bind to for offering NTP service.

##### `broadcast`

Data type: `Optional[Array[Struct[{
    interval => Integer,
    address  => Stdlib::IP::Address,
    port     => Optional[Stdlib::Port],
  }]]]`

Array of broadcast configurations, to make chrony advertise time by broadcasting.

##### `clientloglimit`

Data type: `Optional[Integer]`

Configures the maximum memory that chrony is allowed to allocate for logging client accesses.

##### `noclientlog`

Data type: `Optional[Boolean]`

Toggles whether client accesses are logged or not. If this statement is present, logging is turned off.

##### `local`

Data type: `Optional[Struct[{
    stratum  => Optional[Integer],
    distance => Optional[Integer],
    orphan   => Optional[Boolean],
  }]]`

Configures the chrony local reference mode. See chrony.conf man-page for details of use.

##### `port`

Data type: `Optional[Stdlib::Port]`

Sets the port on which chrony will listen for NTP requests.

##### `ratelimit`

Data type: `Optional[Struct[{
    interval => Optional[Integer[-4,12]],
    burst    => Optional[Integer[1,255]],
    leak     => Optional[Integer[1,4]],
  }]]`

Configures response rate limiting of NTP packets.

##### `smoothtime`

Data type: `Optional[Struct[{
    max_freq   => Integer,
    max_wander => Variant[Float,Integer],
    leaponly   => Optional[Boolean],
  }]]`

Configures smoothing of time that chrony servers to clients. See chrony.conf man-page for details of use.

##### `bindcmdaddress_v4`

Data type: `Optional[Stdlib::IP::Address::V4]`

Configures the IPv4 network interface on which chrony will listen for command packets (ie. from chronyc).

##### `bindcmdaddress_v6`

Data type: `Optional[Stdlib::IP::Address::V6]`

Configures the IPv6 network interface on which chrony will listen for command packets (ie. from chronyc).

##### `bindcmdaddress_sock`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the Unix domain command socket.

##### `cmdaccess_rules`

Data type: `Optional[Array[Struct[{
    access => Enum['cmdallow', 'cmddeny'],
    all    => Optional[Boolean],
    subnet => Optional[String],
  }]]]`

An ordered array of command access rules.

##### `cmdport`

Data type: `Optional[Stdlib::Port]`

Configures the port chrony will listen on for command packets.

##### `cmdratelimit`

Data type: `Optional[Struct[{
    interval => Optional[Integer[-4,12]],
    burst    => Optional[Integer[1,255]],
    leak     => Optional[Integer[1,4]],
  }]]`

Configures response rate limiting for command packets.

##### `hwclockfile`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the adjtime file used by the Linux hwclock.

##### `rtcautotrim`

Data type: `Optional[Integer]`

Sets the rtcautotrim threshold. See chrony.conf man-page for details of use.

##### `rtcdevice`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the device file for accessing the RTC.

##### `rtcfile`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the file where chrony saves RTC tracking parameters.

##### `rtconutc`

Data type: `Optional[Boolean]`

Configures RTC to assume that the RTC is keeping UTC time.

##### `rtcsync`

Data type: `Optional[Boolean]`

Configures chrony to periodically copy system time to the RTC.

##### `log`

Data type: `Optional[Struct[{
    measurements => Optional[Boolean],
    statistics   => Optional[Boolean],
    tracking     => Optional[Boolean],
    rtc          => Optional[Boolean],
    refclocks    => Optional[Boolean],
    tempcomp     => Optional[Boolean],
  }]]`

Configures chrony logging behaviour. See chrony.conf man-page for details of use.

##### `logbanner`

Data type: `Optional[Integer]`

Sets the frequency with which chrony will print a banner describing the fields of the log file.

##### `logchange`

Data type: `Optional[Variant[Float,Integer]]`

Sets the threshold for adjustment of system clock that will generate a syslog message.

##### `logdir`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the chrony log directory.

##### `mailonchange`

Data type: `Optional[Struct[{
    email     => String,
    threshold => Variant[Float,Integer],
  }]]`

Configures an email address where alerts are sent if chrony applies a correction exceeding a threshold.

##### `include`

Data type: `Optional[Array[Stdlib::Absolutepath]]`

An array of complete paths to files that will be included in the chrony configuration.

##### `keyfile`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the keyfile for NTP authentication.

##### `lock_all`

Data type: `Optional[Boolean]`

Configures chrony to lock the daemon into RAM so that it never gets paged out.

##### `pidfile`

Data type: `Optional[Stdlib::Absolutepath]`

Complete path to the chrony pidfile.

##### `sched_priority`

Data type: `Optional[Integer[0,100]]`

Configures the scheduling priority. See chrony.conf man-page for details of use.

##### `user`

Data type: `Optional[String]`

Sets the name of the user which runs chrony.
