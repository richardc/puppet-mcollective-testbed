define mco_2::configfile (
  $path = $name,
  $data = {},
)
{
  file { $path:
    content => template('mco_2/data.cfg.erb'),
  }
}
