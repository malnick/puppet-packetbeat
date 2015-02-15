class packetbeat::package {
   
    if $::osfamily == 'Debian' {
        $package = '/usr/bin/curl -L -o /tmp/packetbeat https://github.com/packetbeat/packetbeat/releases/download/v0.4.3/packetbeat_0.4.3-1_amd64.deb',
    }
    elsif $::osfamily == 'RedHat' {
        $package = '/usr/bin/curl -L -o /tmp/packetbeat https://github.com/packetbeat/packetbeat/releases/download/v0.4.3/packetbeat-0.4.3-1.el6.x86_64.rpm',
    }

    exec { 'download_packetbeat':
        command => $package,
        creates => '/tmp/packetbeat',
    }

    package { '/tmp/packetbeat':
        ensure   => installed,
        provider => 'dpkg',
        require  => Exec['download_packetbeat'],
    }
}


