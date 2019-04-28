# @summary Installs and configures the chrony NTP daemon.
#
# Installs and configures the chrony NTP daemon.
#
# @param package_ensure
#   What state to ensure the chrony package is in. Default value: 'present'.
#
# @param service_ensure
#   What state to ensure the chrony service is in. Default value: 'running'.
#
# @param service_enable
#   Whether or not the chrony service should be automatically started on system boot. Default value: true.
#
# @param config
#   The complete path to the chrony configuration file.
#
# @param package
#   Name of the chrony package to install.
#
# @param service
#   Name of the chrony service on the system.
#
# @param servers
#   Array of NTP servers to configure as sources.
#
# @param peers
#   Array of NTP servers to configure as peers.
#
# @param pools
#   Array of NTP server pools to configure.
#
# @param initstepslews
#   Array of initstepslew threshold configurations. See chrony.conf man-page for details of use.
#
# @param refclocks
#   Array of reference clock configurations.
#
# @param manual
#   Toggles support for the settime command in chronyc. Default value: false.
#
# @param acquisitionport
#   Configures the source port number to use in outgoing requests.
#
# @param bindacqaddress
#   Sets the source network interface which chrony uses for outgoing requests.
#
# @param dumpdir
#   Complete path to the directory where measurement histories are saved.
#
# @param maxsamples
#   Sets the default max number of samples that chrony should keep for each source.
#
# @param minsamples
#   Sets the default min number of samples that chrony should keep for each source.
#
# @param combinelimit
#   Limits which sources are included in the combining algorithm. See chrony.conf man-page for details of use.
#
# @param maxdistance
#   Sets the maximum allowed distance to root for the sources to be considered by the source selection algorithm.
#
# @param maxjitter
#   Sets the maximum allowed amount of jitter for the sources to be considered by the source selection algorithm.
#
# @param minsources
#   Sets the minimum number of sources that needs to be available for selection before the local clock is updated.
#
# @param reselectdist
#   Sets the reselect distance. See chrony.conf man-page for details of use.
#
# @param stratumweight
#   Sets the amount of distance that should be added per stratum when selecting a source.
#
# @param corrtimeratio
#   Sets the corrtimeratio. See chrony.conf man-page for details of use.
#
# @param driftfile
#   Complete path to the chrony driftfile.
#
# @param fallbackdrift
#   Sets the fallbackdrift. See chrony.conf man-page for details of use.
#
# @param leapsecmode
#   Configures the method used to correct for leap seconds.
#
# @param leapsectz
#   Set the name of the timezone to use for determining when leap seconds occur.
#
# @param makestep
#   Configures under which circumstances chrony will step the system clock.
#
# @param maxchange
#   Sets the maximum allowed offset corrected on a clock update.
#
# @param maxclockerror
#   Sets the maxclockerror. See chrony.conf man-page for details of use.
#
# @param maxdrift
#   Sets the maximum assumed drift of the system clock.
#
# @param maxupdateskew
#   Sets the maxupdateskew. See chrony.conf man-page for details of use.
#
# @param maxslewrate
#   Sets the maximum rate at which chrony is allowed to slew the time.
#
# @param tempcomp
#   Configures temperature compensation. See chrony.conf man-page for details of use.
#
# @param access_rules
#   Ordered array of chrony NTP-server access rules.
#
# @param bindaddress_v4
#   IPv4 address on the system that chrony should bind to for offering NTP service.
#
# @param bindaddress_v6
#   IPv6 address on the system that chrony should bind to for offering NTP service.
#
# @param broadcast
#   Array of broadcast configurations, to make chrony advertise time by broadcasting.
#
# @param clientloglimit
#   Configures the maximum memory that chrony is allowed to allocate for logging client accesses.
#
# @param noclientlog
#   Toggles whether client accesses are logged or not. If this statement is present, logging is turned off.
#
# @param local
#   Configures the chrony local reference mode. See chrony.conf man-page for details of use.
#
# @param port
#   Sets the port on which chrony will listen for NTP requests.
#
# @param ratelimit
#   Configures response rate limiting of NTP packets.
#
# @param smoothtime
#   Configures smoothing of time that chrony servers to clients. See chrony.conf man-page for details of use.
#
# @param bindcmdaddress_v4
#   Configures the IPv4 network interface on which chrony will listen for command packets (ie. from chronyc).
#
# @param bindcmdaddress_v6
#   Configures the IPv6 network interface on which chrony will listen for command packets (ie. from chronyc).
#
# @param bindcmdaddress_sock
#   Complete path to the Unix domain command socket.
#
# @param cmdaccess_rules
#   An ordered array of command access rules.
#
# @param cmdport
#   Configures the port chrony will listen on for command packets.
#
# @param cmdratelimit
#   Configures response rate limiting for command packets.
#
# @param hwclockfile
#   Complete path to the adjtime file used by the Linux hwclock.
#
# @param rtcautotrim
#   Sets the rtcautotrim threshold. See chrony.conf man-page for details of use.
#
# @param rtcdevice
#   Complete path to the device file for accessing the RTC.
#
# @param rtcfile
#   Complete path to the file where chrony saves RTC tracking parameters.
#
# @param rtconutc
#   Configures RTC to assume that the RTC is keeping UTC time.
#
# @param rtcsync
#   Configures chrony to periodically copy system time to the RTC.
#
# @param log
#   Configures chrony logging behaviour. See chrony.conf man-page for details of use.
#
# @param logbanner
#   Sets the frequency with which chrony will print a banner describing the fields of the log file.
#
# @param logchange
#   Sets the threshold for adjustment of system clock that will generate a syslog message.
#
# @param logdir
#   Complete path to the chrony log directory.
#
# @param mailonchange
#   Configures an email address where alerts are sent if chrony applies a correction exceeding a threshold.
#
# @param include
#   An array of complete paths to files that will be included in the chrony configuration.
#
# @param keyfile
#   Complete path to the keyfile for NTP authentication.
#
# @param lock_all
#   Configures chrony to lock the daemon into RAM so that it never gets paged out.
#
# @param pidfile
#   Complete path to the chrony pidfile.
#
# @param sched_priority
#   Configures the scheduling priority. See chrony.conf man-page for details of use.
#
# @param user
#   Sets the name of the user which runs chrony.
#
# @example Installs and configures chrony with default settings
#   class { 'chrony': }
#
# @example Installs and configures chrony with specified source servers
#   class { 'chrony':
#     servers => [
#       { hostname => 'ntp1.mydomain.tld' },
#       { hostname => 'ntp2.mydomain.tld' }
#     ]
#   }
#       
# @example Installs and configures chrony to serve time to clients on the 192.168.1.0/24 network.
#   class { 'chrony':
#     access_rules => [
#       {
#         access => 'allow',
#         subnet => '192.168.1'
#       }
#     ]
#   }
#
class chrony (
  Enum['absent', 'present']                                        $package_ensure,
  Stdlib::Ensure::Service                                          $service_ensure,
  Boolean                                                          $service_enable,
  Stdlib::Absolutepath                                             $config,
  String                                                           $package,
  String                                                           $service,
  Optional[Array[Struct[{
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
  }]]]                                                             $servers,
  Optional[Array[Struct[{
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
  }]]]                                                             $peers,
  Optional[Array[Struct[{
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
  }]]]                                                             $pools,
  Optional[Array[Struct[{
    hostnames => Array[String],
    threshold => Integer,
  }]]]                                                             $initstepslews,
  Optional[Array[Struct[{
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
  }]]]                                                             $refclocks,
  Optional[Boolean]                                                $manual,
  Optional[Stdlib::Port]                                           $acquisitionport,
  Optional[Stdlib::IP::Address]                                    $bindacqaddress,
  Optional[Stdlib::Absolutepath]                                   $dumpdir,
  Optional[Integer[0,64]]                                          $maxsamples,
  Optional[Integer[0,64]]                                          $minsamples,
  Optional[Integer]                                                $combinelimit,
  Optional[Integer]                                                $maxdistance,
  Optional[Integer]                                                $maxjitter,
  Optional[Integer]                                                $minsources,
  Optional[Integer]                                                $reselectdist,
  Optional[Variant[Float,Integer]]                                 $stratumweight,
  Optional[Integer]                                                $corrtimeratio,
  Optional[Stdlib::Absolutepath]                                   $driftfile,
  Optional[Tuple[Integer, Integer]]                                $fallbackdrift,
  Optional[Enum['system', 'step', 'slew', 'ignore']]               $leapsecmode,
  Optional[String]                                                 $leapsectz,
  Optional[Tuple[Variant[Float,Integer], Variant[Float, Integer]]] $makestep,
  Optional[Tuple[Integer, Integer, Integer]]                       $maxchange,
  Optional[Variant[Float,Integer]]                                 $maxclockerror,
  Optional[Variant[Float,Integer]]                                 $maxdrift,
  Optional[Variant[Float,Integer]]                                 $maxupdateskew,
  Optional[Variant[Float,Integer]]                                 $maxslewrate,
  Optional[Hash]                                                   $tempcomp,
  Optional[Array[Struct[{
    access => Enum['allow', 'deny'],
    all    => Optional[Boolean],
    subnet => Optional[String],
  }]]]                                                             $access_rules,
  Optional[Stdlib::IP::Address::V4]                                $bindaddress_v4,
  Optional[Stdlib::IP::Address::V6]                                $bindaddress_v6,
  Optional[Array[Struct[{
    interval => Integer,
    address  => Stdlib::IP::Address,
    port     => Optional[Stdlib::Port],
  }]]]                                                             $broadcast,
  Optional[Integer]                                                $clientloglimit,
  Optional[Boolean]                                                $noclientlog,
  Optional[Struct[{
    stratum  => Optional[Integer],
    distance => Optional[Integer],
    orphan   => Optional[Boolean],
  }]]                                                              $local,
  Optional[Stdlib::Port]                                           $port,
  Optional[Struct[{
    interval => Optional[Integer[-4,12]],
    burst    => Optional[Integer[1,255]],
    leak     => Optional[Integer[1,4]],
  }]]                                                              $ratelimit,
  Optional[Struct[{
    max_freq   => Integer,
    max_wander => Variant[Float,Integer],
    leaponly   => Optional[Boolean],
  }]]                                                              $smoothtime,
  Optional[Stdlib::IP::Address::V4]                                $bindcmdaddress_v4,
  Optional[Stdlib::IP::Address::V6]                                $bindcmdaddress_v6,
  Optional[Stdlib::Absolutepath]                                   $bindcmdaddress_sock,
  Optional[Array[Struct[{
    access => Enum['cmdallow', 'cmddeny'],
    all    => Optional[Boolean],
    subnet => Optional[String],
  }]]]                                                             $cmdaccess_rules,
  Optional[Stdlib::Port]                                           $cmdport,
  Optional[Struct[{
    interval => Optional[Integer[-4,12]],
    burst    => Optional[Integer[1,255]],
    leak     => Optional[Integer[1,4]],
  }]]                                                              $cmdratelimit,
  Optional[Stdlib::Absolutepath]                                   $hwclockfile,
  Optional[Integer]                                                $rtcautotrim,
  Optional[Stdlib::Absolutepath]                                   $rtcdevice,
  Optional[Stdlib::Absolutepath]                                   $rtcfile,
  Optional[Boolean]                                                $rtconutc,
  Optional[Boolean]                                                $rtcsync,
  Optional[Struct[{
    measurements => Optional[Boolean],
    statistics   => Optional[Boolean],
    tracking     => Optional[Boolean],
    rtc          => Optional[Boolean],
    refclocks    => Optional[Boolean],
    tempcomp     => Optional[Boolean],
  }]]                                                              $log,
  Optional[Integer]                                                $logbanner,
  Optional[Variant[Float,Integer]]                                 $logchange,
  Optional[Stdlib::Absolutepath]                                   $logdir,
  Optional[Struct[{
    email     => String,
    threshold => Variant[Float,Integer],
  }]]                                                              $mailonchange,
  Optional[Array[Stdlib::Absolutepath]]                            $include,
  Optional[Stdlib::Absolutepath]                                   $keyfile,
  Optional[Boolean]                                                $lock_all,
  Optional[Stdlib::Absolutepath]                                   $pidfile,
  Optional[Integer[0,100]]                                         $sched_priority,
  Optional[String]                                                 $user,
) {
  # Manage chrony package
  package { $package:
    ensure => $package_ensure,
  }

  # Manage configuration file
  file { $config:
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp("${module_name}/chrony.conf.epp"),
    require => Package[$package],
    notify  => Service[$service],
  }

  # Manage chrony service
  service { $service:
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
