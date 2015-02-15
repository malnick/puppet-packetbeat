class packetbeat::dashboard {

    exec { 'get_dashboards':
        command => '/usr/bin/curl -L -o /tmp/dashboards.tar.gz https://github.com/packetbeat/dashboards/archive/v0.4.1.tar.gz',
        creates => '/tmp/dashboards.tar.gz',
    }

    exec { 'untar_dashboards':
        command => '/bin/tar xzvf /tmp/dashboards.tar.gz -C /tmp',
        creates => '/tmp/dashboards-0.4.1',
        require => Exec['get_dashboards'],
    }

    exec { 'load_dashboards':
        command => '/tmp/dashboards-0.4.1/load.sh',
        cwd     => '/tmp/dashboards-0.4.1',
        require => Exec['untar_dashboards'],
    }
}
