define mcollective::client::config::fragment(
  $content
)
{
  concat::fragment { "mcollective_client_${title}":
    target  => '/etc/mcollective/client.cfg',
    content => $content,
  }
}
