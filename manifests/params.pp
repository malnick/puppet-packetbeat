class packetbeat::params(
  $aggregator       = 'localhost',
  $redis_host       = 'localhost',
  $es_port          = '9200',
  $interfaces       = 'any',
  $disable_procs    = false,
  $agentname        = $::fqdn,
  $uid              = '501',
  $gid              = '501',
  $ensure           = 'running',
  $enable           = true,
  $es_enabled       = true,
  $redis_enabled    = false,
  $mysqld_mon       = false,
  $nginx_mon        = false,
  $app_procs        = false,
  $http_protocols   = ['80', '8080', '8000', '5000', '8002','443', '8140'],
  $mysql_protocols  = undef, #[3306],
  $redis_protocols  = undef, #[6379],
  $pgsql_protocols  = undef, #[5432],
){



}

