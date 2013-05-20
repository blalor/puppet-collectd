# = Class: collect::plugin::apache
#
# This class configures the apache plugin for Collectd.
#
# == Parameters:
#
# None
#
# == Requires:
#
# Class['collectd']
#
# Sample Usage:
# 
# include collect::plugin::carbon
#
class collectd::plugin::apache {
    include collectd
    include apache::params
    
    ## EPEL package
    package {'collectd-apache':
        before => File[$collectd::collectd_dot_d],
    }

    collectd::plugin {'apache':
        config  => template('collectd/plugin/apache.conf.erb'),

        require => Package['collectd-apache'],
    }

    ## configure mod_status for collectd
    file {"${apache::params::vdir}/status.conf":
        ensure  => present,
        content => "ExtendedStatus On\n<Location /mod_status>\nSetHandler server-status\n</Location>\n",
    }
}
