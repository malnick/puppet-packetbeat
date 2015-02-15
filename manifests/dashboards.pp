class packetbeat::dashboards {

    file { "packetbeat.template.json":
        ensure => present,
        source => 'puppet:///modules/packetbeat/packetbeat.template.json',
        path   => '/tmp/packetbeat.template.json',
    }

    exec { "put_dashboards":
        command => '/usr/bin/curl -XPUT "http://localhost:9200/_template/packetbeat" -d@/tmp/packetbeat.template.json',
        unless  => '/usr/bin/curl -XGET "http://localhost:9200/_template/packetbeat?pretty"',
    }
}
