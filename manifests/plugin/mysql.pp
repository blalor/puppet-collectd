# = Class: collect::plugin::mysql
#
# This class configures the mysql plugin for Collectd.
#
# == Parameters:
#
# None.
#
# == Requires:
#
# Class['collectd']
#
# Sample Usage:
# 
# class {'collect::plugin::mysql': }
#
class collectd::plugin::mysql {
    include collectd
    
    ## EPEL package
    package {'collectd-mysql':
        before => File[$collectd::collectd_dot_d],
    }

    collectd::plugin {'mysql':
        config  => template('collectd/plugin/mysql.conf.erb'),

        require => Package['collectd-mysql'],
    }
}
