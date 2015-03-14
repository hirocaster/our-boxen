class people::hirocaster {
  # ruby::plugin { 'rbenv-sudo':
  #   ensure => 'master',
  #   source => 'dcarley/rbenv-sudo'
  # }
  class { 'nodejs::global': version => 'v0.10.1' }
  nodejs::module { 'yo': node_version => 'v0.10' }
  nodejs::module { 'grunt-cli': node_version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }
  nodejs::module { 'generator-angular': node_version => 'v0.10' }
  nodejs::module { 'ninja': node_version => 'v0.10' }
  nodejs::module { 'ungit': node_version => 'v0.10' }

  class { 'ruby::global':
    version => 'system'
  }

  ruby_gem { "bundler for all ruby version":
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  ruby_gem { "ghn for all ruby version":
    gem          => 'ghn',
    ruby_version => '*',
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

  include atom
  atom::package { 'markdown-preview': }
}
