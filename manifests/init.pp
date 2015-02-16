class packetbeat (
  
  $aggregator       = $packetbeat::params::aggregator,
  $es_port          = $packetbeat::params::es_port,
  $interfaces       = $packetbeat::params::interfaces,
  $disable_procs    = $packetbeat::params::disable_procs,
  $agentname        = $packetbeat::params::agentname ,
  $uid              = $packetbeat::params::uid,
  $gid              = $packetbeat::params::gid,
  $es_enabled       = $packetbeat::params::es_enabled,
  $redis_enabled    = $packetbeat::params::redis_enabled,
  # Which procs to monitor
  $mysqld_mon       = $packetbeat::params::mysqld_mon,
  $nginx_mon        = $packetbeat::params::nginx_mon,
  $app_procs        = $packetbeat::params::app_procs,
  # Protocols, each has an array of ports 
  $http_protocols   = $packetbeat::params::http_protocols,
  $mysql_protocols  = $packetbeat::params::mysql_protocols,
  $redis_protocols  = $packetbeat::params::redis_protocols,
  $pgsql_protocols  = $packetbeat::params::pgsql_protocols,

) inherits packetbeat::params {

  class { ::packetbeat::package:}
  ->
  class { ::packetbeat::config: }
  ->
  class { ::packetbeat::service: }

}
