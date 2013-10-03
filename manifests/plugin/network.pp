class collectd::plugin::network (
    $port,
    $server = undef,
    $listen_ip = $::ipaddress,
) {
    if (! is_numeric($port)) {
        fail("${port} is not numeric")
    }
    
    if ($server != undef) {
        validate_string($server)
    }
    
    if (! is_ip_address($listen_ip)) {
        fail("${listen_ip} is not an IP address")
    }
    
    include collectd
        
    collectd::plugin {'network':
        config => template("collectd/plugin/network.conf.erb"),
    }
}
