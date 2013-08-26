class people::hirocaster {
  ruby::plugin { 'rbenv-sudo':
    ensure => 'master',
    source  => 'dcarley/rbenv-sudo'
  }
  class { 'nodejs::global': version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }
  nodejs::module { 'ninja': node_version => 'v0.10' }
  nodejs::module { 'ungit': node_version => 'v0.10' }
}
