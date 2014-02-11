class people::hirocaster {
  ruby::plugin { 'rbenv-sudo':
    ensure => 'master',
    source  => 'dcarley/rbenv-sudo'
  }
  class { 'nodejs::global': version => 'v0.10' }
  nodejs::module { 'yo': node_version => 'v0.10' }
  nodejs::module { 'grunt-cli': node_version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }
  nodejs::module { 'generator-angular': node_version => 'v0.10' }
  nodejs::module { 'ninja': node_version => 'v0.10' }
  nodejs::module { 'ungit': node_version => 'v0.10' }

  $version = '2_0_0'
  ruby::gem { "bundler for ${version}":
    gem     => 'bundler',
    ruby    => $version,
    version => '~> 1.2.0'
  }

  ruby::version { '2.1.0': }

  include redis

  # python
  include python
  package { 'pyenv-virtualenv': }

  homebrew::tap { 'railwaycat/emacsmacport': }
}
