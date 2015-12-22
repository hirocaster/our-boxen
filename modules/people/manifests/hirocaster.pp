class people::hirocaster {
  # Node.js
  # FIX: 昔入れたnvmモジュールの残骸を削除
  file { '/opt/boxen/bin/node':
    ensure => absent
  }
  file { '/opt/boxen/bin/npm':
    ensure => absent
  }

  include nodejs
  $version = "4.1" # specific to hirocaster.yaml
  class { 'nodejs::global':
    version => $version
  }
  npm_module { "bower for ${version}":
    module       => 'bower',
    node_version => $version,
  }
  npm_module { "yo for ${version}":
    module       => 'yo',
    node_version => $version,
  }
  npm_module { "grunt-cli for ${version}":
    module       => 'grunt-cli',
    node_version => $version,
  }
  npm_module { "generator-angular for ${version}":
    module       => 'generator-angular',
    node_version => $version,
  }
  npm_module { "ninja for ${version}":
    module       => 'ninja',
    node_version => $version,
  }
  npm_module { "babel for ${version}":
    module       => 'babel',
    node_version => $version,
  }
  npm_module { "babel-cli for ${version}":
    module       => 'babel-cli',
    node_version => $version,
  }
  npm_module { "gulp for ${version}":
    module       => 'gulp',
    node_version => $version,
  }

  # Ruby
  include ruby
  class { 'ruby::global':
    version => 'system'
  }
  ruby::version { '2.2.2': }
  ruby_gem { "bundler for all ruby version":
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }
  ruby_gem { "ghn for all ruby version":
    gem          => 'ghn',
    ruby_version => '*',
  }
  ruby_gem { "rubocop for all ruby version":
    gem          => 'rubocop',
    ruby_version => '*',
  }
  ruby_gem { "ruby-lint for all ruby version":
    gem          => 'ruby-lint',
    ruby_version => '*',
  }

  include redis

  # python
  include python
  package { 'pyenv-virtualenv': }
  python::pip { 'mycli':
    virtualenv => '/opt/boxen/homebrew/',
  }

  # homebrew
  include brewcask
  homebrew::tap { 'railwaycat/emacsmacport': }
  # homebrew::tap { 'homebrew/dupes': }
  # package { 'homebrew/dupes/apple-gcc42': }

  # include atom
  # atom::package { 'markdown-preview': }
  # atom::package { 'markdown-scroll-sync': }
  # atom::package { 'japanese-wrap': }
  # atom::package { 'autosave': }
}
