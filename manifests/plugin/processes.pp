# = Class: collect::plugin::processes
#
# This class configures the processes plugin for Collectd.
#
# == Parameters:
#
# $processes:: an array of process names to monitor
#
# == Requires:
#
# Nothing.
#
# Sample Usage:
# 
# class {'collect::plugin::processes': 
#     processes => ['java', 'node'],
# }
#
class collectd::plugin::processes (
    $processes,
) {
    include collectd

    collectd::plugin {'processes':
        config => template("collectd/plugin/processes.conf.erb"),
    }
}
