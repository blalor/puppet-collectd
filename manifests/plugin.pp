define collectd::plugin (
    $plugin = $title,
    $config = undef,
) {
    include collectd

    if $config == undef {
        $config_real = "LoadPlugin \"${plugin}\"\n"
    } else {
        $config_real = $config
    }
    
    file {"${collectd::collectd_dot_d}/${title}.conf":
        content => "${config_real}",

        notify  => Service['collectd'],
    }
}
