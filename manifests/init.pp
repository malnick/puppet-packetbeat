class packetbeat (
  
  $aggregator       = $packetbeat::params::host,
  $port             = $packetbeat::params::port,
  $interfaces       = $packetbeat::params::interfaces,
  $disable_procs    = $packetbeat::params::disable_procs,
  $agentname        = $packetbeat::params::agentname ,
  $uid              = $packetbeat::params::uid,
  $gid              = $packetbeat::params::gid,

) inherits packetbeat::params {

  class { ::packetbeat::package:}
  ->
  class { ::packetbeat::config: }
  ->
  class { ::packetbeat::service: }

}
