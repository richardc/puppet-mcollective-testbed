Two types for setting parameters in the two global config files (inheriting
from ini_file, so we can purge the respective types in mcollective::server and
mcollective::client)

    # Sets connector = activemq in /etc/mcollective/server.cfg
    mcollective_server_setting { 'connector':
      value => 'activemq',
    }

    # Sets things in /etc/mcollective
    mcollective_client_setting { 'connector':
      value => 'activemq',
    }

One define for setting up a plugin via plugin.d - would probably template the
whole file, so no side-channel to build this up...?

    # /etc/mcollective/plugin.d/puppet.cfg
    mcollective::plugin { 'puppet':
      settings => {
        'splay' => 'true',
      },
    }

Though if we don't template it, we could make another type to build them from
with a composite namevar:

    mcollective_plugin_setting { 'puppet:splay':
      value => 'true',
    }


Entry-points:

    # small bikeshed - call it mcollective::defaults not ::params and the
    # notion of forking it to parameterise becomes even sillier
    class mcollective inherits mcollective::defaults (
        $connector      = $mcollective::defaults::connector,
        $activemq_hosts = $mcollective::defaults::activemq_hosts,
    ) {
       # This class won't do much, it's there as a concentrator for common
       # parameters, save users from having to specify
       # mcollective::server::connector and mcollective::client::connector
       # as the same value in two places
    }

    class mcollective::server {
        resource { 'mcollective_server_setting': purge => true }
        class { "mcollective::server::connector::${mcollective::connector}": }
    }

    class mcollective::server::connector::activemq {
       # should duplicate-define if we get two.  good.
       mcollective_server_setting { 'connector':
         value => 'activemq',
       }
       mcollective_server_setting { 'direct_addressing':
         value => 1,
       }
       mcollective_server_setting { 'plugin.activemq.pool.size':
         value => size($mcollective::activemq_hosts),
       }

       # some shitty define to iterate the $mcollective::activemq_hosts into
       # plugin.activemq.pool.$n.host settings
    }


So usage becomes

    node 'mco-activemq.example.com' {
      class { 'mcollective':
        activemq_hosts => [ 'mco-activemq.example.com' ],
      }
      class { 'mcollective::server': }
      class { 'mcollective::activemq': }
    }

