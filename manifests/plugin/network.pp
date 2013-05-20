class collectd::plugin::network (
    $port,
    $server = undef,
    $listen_ip = $::ipaddress,
) {
    include collectd
        
    collectd::plugin {'network':
        config => template("collectd/plugin/network.conf.erb"),
    }
}
