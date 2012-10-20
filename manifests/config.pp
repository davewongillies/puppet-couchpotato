class couchpotato::config {

    $couchpotato_data = "/usr/local/couchpotato-data"
    $couchpotato_api_key = extlookup("couchpotato_api_key")
    $couchpotato_port = extlookup("couchpotato_port")
    $nzbmatrix_username = extlookup("nzbmatrix_username")
    $nzbmatrix_apikey = extlookup("nzbmatrix_apikey")
    $sabnzbd_host = extlookup("sabnzbd_host")
    $sabnzbd_root = extlookup("sabnzbd_root")
    $sabnzbd_apikey = extlookup("sabnzbd_apikey")

    file { "/usr/local/couchpotato-data":
        ensure => directory,
        owner => 'couchpotato',
        group => 'automators',
        recurse => 'true'
    }
    
    file { "/usr/local/couchpotato-data/settings.conf":
        content => template('couchpotato/settings.conf.erb'),
        owner => 'couchpotato',
        group => 'automators',
        mode => '0644',
        require => File['/usr/local/couchpotato-data']
    }
    
}