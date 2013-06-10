define mcollective::server::config::fragment(
  $content
)
{
  concat::fragment { $title:
    target  => '/etc/mcollective/server.cfg',
    content => $content,
  }
}
