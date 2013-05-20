class collectd::plugin::write_graphite (
    $host = 'localhost',
    $port = 2003,
) {
    include collectd

    collectd::plugin {'write_graphite':
        config => template("collectd/plugin/write_graphite.conf.erb"),
    }
}
