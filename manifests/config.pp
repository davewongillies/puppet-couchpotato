class couchpotato::config {

    $couchpotato_data = "/usr/local/couchpotato-data"
    $couchpotato_api_key = extlookup("couchpotato_api_key")
    $couchpotato_port = extlookup("couchpotato_port")

    file { "/usr/local/couchpotato-data":
        owner => 'couchpotato',
        group => 'couchpotato',
        recurse => 'true'
    }
    
    file { "/usr/local/couchpotato-data/settings.conf":
        content => template('couchpotato/settings.conf.erb'),
        owner => 'couchpotato',
        group => 'couchpotato',
        mode => '0644',
        require => File['/usr/local/couchpotato-data']
    }
    
}