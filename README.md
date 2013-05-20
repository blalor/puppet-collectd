
# Collectd module for Puppet

Quick and dirty, per the usual.

## example

    include collectd
    
    collectd::plugin {'cpu': }
    collectd::plugin {'interface': }
    collectd::plugin {'load': }
    collectd::plugin {'memory': }
    collectd::plugin {'disk': }
    collectd::plugin {'df': }
    
    ## send data to graphite at localhost:2003
    include collectd::plugin::write_graphite

