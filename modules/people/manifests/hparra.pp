
# hparra
class people::hparra {

  # HOME
  $home = "/Users/${::boxen_user}"

  # Where I keep all my github and bitbucket repositories
  $repositories = "${home}/Repositories"

  file { $repositories:
    ensure  => directory
  }

  #
  # Git
  #

  git::config::global{ 'user.name':
    value => 'Hector G. Parra',
  }

  git::config::global{ 'user.email':
    value => 'hector@hectorparra.com',
  }

  #
  # OS X Defaults
  # https://github.com/boxen/puppet-osx
  #

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::dock::autohide
  include osx::dock::clear_dock

  include osx::finder::unhide_library
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control

  # NOTE: You cannot use parenthesis in this string.
  osx::recovery_message { 'If this Mac is found, please call 949-829-1009': }

  osx::dock::hot_corner { 'Put Display to Sleep':
    position => 'Bottom Right',
    action => 'Put Display to Sleep',
  }

  #
  #
  #

  # Google Chrome
  # https://github.com/boxen/puppet-chrome
  include chrome

  # iTerm 2
  # https://github.com/boxen/puppet-iterm2
  include iterm2::dev
  include iterm2::colors::solarized_dark

  # Alfred
  # https://github.com/boxen/puppet-alfred
  include alfred

  #
  # Sublime Text
  # https://github.com/boxen/puppet-sublime_text
  #

  include sublime_text

  # Improved Monokai Theme esp. for Markdown
  # https://github.com/jonschlinkert/sublime-monokai-extended
  sublime_text::package { 'Monokai Extended':
    source => 'jonschlinkert/sublime-monokai-extended'
  }

  # Emacs keybindings
  # https://github.com/grundprinzip/sublemacspro
  sublime_text::package { 'SublemacsPro':
    source => 'grundprinzip/sublemacspro'
  }

  # Enforce .editorconfig rules
  # https://github.com/sindresorhus/editorconfig-sublime
  sublime_text::package { 'EditorConfig':
    source => 'sindresorhus/editorconfig-sublime'
  }

  # Git status/diff markers
  # https://github.com/jisaacks/GitGutter
  sublime_text::package { 'GitGutter':
    source => 'jisaacks/GitGutter'
  }

  # Always remove trailing space on save
  # https://github.com/SublimeText/TrailingSpaces
  sublime_text::package { 'TrailingSpaces':
    source => 'SublimeText/TrailingSpaces'
  }

  # .pp
  # https://github.com/russCloak/SublimePuppet
  sublime_text::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet'
  }

  # .less
  # https://github.com/danro/Less-sublime
  sublime_text::package { 'LESS-sublime':
    source => 'danro/Less-sublime'
  }

  # .jade
  # https://github.com/danro/Less-sublime
  sublime_text::package { 'jade-tmbundle':
    source => 'davidrios/jade-tmbundle'
  }

  # Github for Mac
  # https://github.com/boxen/puppet-github_for_mac
  include github_for_mac

  # ScreenHero
  include screenhero

  # VirtualBox
  # https://github.com/boxen/puppet-virtualbox
  include virtualbox

  # Vagrant
  # https://github.com/boxen/puppet-vagrant
  class { 'vagrant': }

  # Packer
  # https://github.com/boxen/puppet-packer
  # Installs from source
  include packer

  #
  # Nodejs
  # https://github.com/boxen/puppet-nodejs
  #

  # Node 0.10 is already included as part of Boxen

  nodejs::module { 'coffee-script':
    node_version => 'v0.10'
  }

  # yeoman
  # https://www.npmjs.org/package/yo
  nodejs::module { 'yo':
    node_version => 'v0.10'
  }

  nodejs::module { 'gulp':
    node_version => 'v0.10'
  }

  nodejs::module { 'grunt':
    node_version => 'v0.10'
  }

  nodejs::module { 'bower':
    node_version => 'v0.10'
  }

  # https://www.npmjs.org/package/ember-cli
  nodejs::module { 'ember-cli':
    node_version => 'v0.10'
  }

  nodejs::module { 'protractor':
    node_version => 'v0.10'
  }

  nodejs::module { 'jshint':
    node_version => 'v0.10'
  }
}
