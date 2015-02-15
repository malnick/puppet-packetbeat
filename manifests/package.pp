class packetbeat::package {
    
    $package = $::osfamiy ? {
        'Debian' => '/usr/bin/curl -L -o /tmp/packetbeat https://github.com/packetbeat/packetbeat/releases/download/v0.4.3/packetbeat_0.4.3-1_amd64.deb',
        'RedHat' => '/usr/bin/curl -L -o /tmp/packetbeat https://github.com/packetbeat/packetbeat/releases/download/v0.4.3/packetbeat-0.4.3-1.el6.x86_64.rpm',
        default  => fail("Sorry, we only have RedHat and Debian packages available")
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


