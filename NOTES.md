Important user stories
----------------------

Ensure we service http://docs.puppetlabs.com/mcollective/deploy/standard.html
possibly the default configuration.

---

Where possible state things once, so maybe something like:

    class { 'mcollective':
        activemq_hosts => [ 'node1' ],
    }

    # no need to specify activemq hosts as
    # $mcollective::activemq_hosts will supply that
    class { 'mcollective::server': }

    # unless we really want to oveeride that is
    mcollective::client { 'localonly':
        activemq_hosts => [ 'node3'],
    }

---

Everything needs to be composable.  This probably implies a few core defines
and/or data structures.

Given the former though we should try and catch invalid config early, say
things like two connector configurations to the same server would want to go
boom.

---

Multiple clients will need different configurations eg nagios check may have a
user that's just for it in the middleware.

---

Verification
------------

A server.cfg needs a few things before it'll start, a 

should we verify these keys are present?

If we do a more static parameterised classes model then verifcation of required
keys falls out of it, but then so does a lot of extra hassle to support new
options addeed to the config file.