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
  $version = "4.2" # specific to hirocaster.yaml
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

  npm_module { "tslint for ${version}":
    module       => 'tslint',
    node_version => $version,
  }

  npm_module { "typescript for ${version}":
    module       => 'typescript',
    node_version => $version,
  }

  # Ruby
  include ruby

  $ruby_global_version = "2.3.1"

  ruby::version { $ruby_global_version: }

  class { 'ruby::global':
    version => $ruby_global_version
  }

  ruby_gem { "bundler for global version":
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => $ruby_global_version,
  }
  ruby_gem { "ghn for global version":
    gem          => 'ghn',
    ruby_version => $ruby_global_version,
  }
  ruby_gem { "rubocop for global version":
    gem          => 'rubocop',
    ruby_version => $ruby_global_version,
  }
  ruby_gem { "ruby-lint for global version":
    gem          => 'ruby-lint',
    ruby_version => $ruby_global_version,
  }
  ruby_gem { "rcodetools for global version":
    gem          => 'rcodetools',
    ruby_version => $ruby_global_version,
  }

  package { 'imagemagick': } # for RMagic
  package { 'pkg-config': }  # for RMagic
  ruby_gem { "each_dir_zip for global version":
    gem          => 'each_dir_zip',
    ruby_version => $ruby_global_version,
  }

  ruby_gem { "ripper-tags for global":
    gem          => 'ripper-tags',
    ruby_version => $ruby_global_version,
  }

  include redis

  # python
  include python
  package { 'pyenv-virtualenv': }
  include python::virtualenvwrapper
  python::pip { 'mycli':
    virtualenv => '/opt/boxen/homebrew/',
  }

  python::mkvirtualenv{ 'elasticsearch':
    ensure      => present,
    systempkgs  => false,
    distribute  => true
  }
  python::pip { 'elasticsearch':
    virtualenv => '/opt/boxen/data/virturalenvs/elasticsearch',
  }

  # homebrew
  include brewcask
  homebrew::tap { 'railwaycat/emacsmacport': }

  # FIXME:
  # package { 'evernote': provider => 'brewcask' }

  # packages
  include dropbox
  include onepassword
  include virtualbox
  include istatmenus5
}
