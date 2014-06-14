class people::hirocaster {
  ruby::plugin { 'rbenv-sudo':
    ensure => 'master',
    source => 'dcarley/rbenv-sudo'
  }
  class { 'nodejs::global': version => 'v0.10' }
  nodejs::module { 'yo': node_version => 'v0.10' }
  nodejs::module { 'grunt-cli': node_version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }
  nodejs::module { 'generator-angular': node_version => 'v0.10' }
  nodejs::module { 'ninja': node_version => 'v0.10' }
  nodejs::module { 'ungit': node_version => 'v0.10' }

  class { 'ruby::global':
    version => 'system'
  }

  ruby::gem { "bundler for all ruby version":
    gem     => 'bundler',
    ruby    => 'system',
  }

  ruby::gem { "ghn for all ruby version":
    gem     => 'ghn',
    ruby    => 'system',
  }

  include redis

  # python
  include python
  package { 'pyenv-virtualenv': }
  python::pip { 'percol':
    virtualenv => '/opt/boxen/homebrew/',
  }

  homebrew::tap { 'railwaycat/emacsmacport': }
  homebrew::tap { 'homebrew/dupes': }
  package { 'homebrew/dupes/apple-gcc42': }
}
