# = Class: collect::plugin::carbon
#
# This class configures the carbon plugin for Collectd.
#
# == Parameters:
#
# $carbon_host:: hostname where carbon is running
#
# $carbon_port:: port where carbon is running; defaults to 2003
#
# == Requires:
#
# Class['collectd']
#
# Sample Usage:
# 
# class {'collect::plugin::carbon': 
#     carbon_host = "localhost",
#     carbon_port = 2003,
# }
#
class collectd::plugin::carbon (
    $carbon_host = hiera('carbon_host'),
    $carbon_port = 2003,
    $carbon_metric_prefix = 'collectd.',
) {
    include collectd
    
    ## depends on EPEL-provided collectd
    package {'collectd-carbon':
        before => File[$collectd::collectd_dot_d],
    }

    collectd::plugin {'carbon':
        config  => template('collectd/plugin/write_carbon.conf.erb'),

        require => Package['collectd-carbon'],
    }
}
