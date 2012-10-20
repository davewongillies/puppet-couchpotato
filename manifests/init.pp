class couchpotato {
    
    $url = "https://github.com/RuudBurger/CouchPotatoServer.git"
    
    include couchpotato::config
    
    user { 'couchpotato':
        allowdupe => false,
        ensure => 'present',
        uid => '602',
        shell => '/bin/bash',
        gid => '700',
        home => '/home/couchpotato',
        password => '*',
    }

    file { '/home/couchpotato':
        ensure => directory,
        owner => 'couchpotato',
        group => 'automators',
        mode => '0644',
        recurse => 'true'
    }
    
    exec { 'download-couchpotato':
        command => "/usr/bin/git clone $url couchpotato",
        cwd     => '/usr/local',
        creates => "/usr/local/couchpotato",
    }
    
    file { "/usr/local/couchpotato":
        ensure => directory,
        owner => 'couchpotato',
        group => 'automators',
        mode => '0644',
        recurse => 'true'
    }

    file { "/etc/init.d/couchpotato":
        content => template('couchpotato/init-rhel.erb'),
        owner => 'root',
        group => 'root',
        mode => '0755',
    }  
}
