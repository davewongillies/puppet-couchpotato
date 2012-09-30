class couchpotato( $source = 'true' ) {
    
    $url = "https://github.com/RuudBurger/CouchPotatoServer.git"
    
    include sickbeard::config
    
    user { 'couchpotato':
        allowdupe => false,
        ensure => 'present',
        uid => '602',
        shell => '/bin/bash',
        gid => '602',
        home => '/home/couchpotato',
        password => '*',
    }
    
    group { "couchpotato":
        allowdupe => false,
        ensure => present,
        gid => 602,
        name => 'couchpotato',
        before => User["couchpotato"]
    }
    
    exec { 'download-couchpotato':
        command => "/usr/bin/git clone $url couchpotato",
        cwd     => '/usr/local',
        creates => "/usr/local/couchpotato",
    }
    
    file { "/usr/local/couchpotato":
        ensure => directory,
        owner => 'couchpotato',
        group => 'couchpotato',
        mode => '0644',
    }

    file { "/etc/init.d/couchpotato":
        content => template('couchpotato/init-rhel.erb'),
        owner => 'root',
        group => 'root',
        mode => '0755',
    }  
}
