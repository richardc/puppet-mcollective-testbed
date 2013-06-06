# The big internal debate I have here is whether to use an existing activemq
# module or just our own because we're special.
#
# We're probably going to have to roll down the special route because someone's
# going to already havbe their ::activemq module which will have a different
# api to whichever one we choose to favour
#
class mcollective::activemq {
  anchor { 'mcollective::activemq::begin': } ->
  class { 'mcollective::activemq::install': } ->
  class { 'mcollective::activemq::keystore': } ->
  class { 'mcollective::activemq::config': } ~>
  class { 'mcollective::activemq::service': } ->
  anchor { 'mcollective::activemq::end': }
}
