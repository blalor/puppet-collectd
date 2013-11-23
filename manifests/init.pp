## configures collectd
class collectd (
    $version,
) {
    $collectd_dot_d = '/etc/collectd.d'

    anchor {'collectd::begin': } ->
    package {'collectd':
        ensure => $version,
    }
    
    case $operatingsystem {
        'Ubuntu': {
            $collectd_conf = '/etc/collectd/collectd.conf'
        }
        'CentOS': {
            $collectd_conf = '/etc/collectd.conf'
        }
        default: {
            fail("unsupported OS ${operatingsystem}")
        }
    }
    
    file {$collectd_conf:
        content => template('collectd/collectd.conf.erb'),

        require => Package['collectd'],
        notify  => Service['collectd'],
    }

    file {$collectd_dot_d:
        ensure  => directory,
        purge   => true,
        recurse => true,
        force   => true,
        require => [
            File[$collectd_conf],
            Package['collectd'],
        ],
        notify  => Service['collectd'],
    }

    service {'collectd':
        ensure  => running,
        enable  => true,
        require => Package['collectd'],
    } ->
    anchor {'collectd::end': }
}
