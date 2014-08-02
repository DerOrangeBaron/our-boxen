class people::tombar{

  osx::recovery_message {
    'If this Mac is found, please email nicolas.eduardo.lopez@gmail.com':
  }

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_save_dialog
#  include osx::global::disable_remote_control_ir_receiver

#  include osx::global::enable_standard_function_keys

  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::2d

  include osx::finder::show_hidden_files
  include osx::no_network_dsstores

  class { 'osx::sound::interface_sound_effects':
    enable => true
  }
	
  class { 'osx::dock::icon_size':
    size => 36
  }

  include bash
  include bash::completion 
  include caffeine
  include ctags 
  include chrome
  include chicken_of_the_vnc
  include coccinellida
  include dash
#  include daisy_disk
  include firefox
  include elasticsearch
  include geoip
  include hipchat
  include shortcat

  include iterm2::stable
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  include iterm2::colors::arthur

  include java
#  include jenkins
#  include limechat
#  include littlesnitch
#  include macvim
#  include packer
  include phantomjs
  include skype
  include sourcetree
  include tmux
  include tunnelblick
  include transmission
  include virtualbox
  vagrant::plugin { ['cachier']:}
  class { 'vagrant': 
    completion => true,
  }
  include vlc
  include wget

  class { 'intellij':
    edition => 'community',
  }

  include vim
  vim::bundle { [
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'tpope/vim-fugitive',
    'godlygeek/tabular',
    'rizzatti/dash.vim',
    'rodjek/vim-puppet',
    'evanmiller/nginx-vim-syntax',
    'derekwyatt/vim-scala'
  ]:
  }

  git::config::global { 'user.email': value => 'elnicolopez@gmail.com' }
  git::config::global { 'user.name': value => 'Nicolas Lopez' }
  git::config::global { 'color.ui': value => 'auto' }

  # set a global gitignore file
  git::config::global { 'core.excludesfile ':
    value   => '~/.gitignore',
    require => File["/Users/${::luser}/.gitignore"]
  }

  # ignore .bundle rbenv implicit gemset folder
  file { "/Users/${::luser}/.gitignore":
    content => '.bundle',
  }

  package { ['pwgen', 'w3m', 'bwm-ng', 'jq', 'unrar', 'pstree', 'wget', 'watch']:
    ensure => present
  }

  # gem install libxml-ruby -- --with-xml2-lib=/opt/boxen/homebrew/opt/libxml2/lib

}
