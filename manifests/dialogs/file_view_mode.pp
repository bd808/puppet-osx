# TODO: Let the user pass in readable values instead of 1, 2, 3, etc.
# Like 'list', 'icon-grid', etc.
# fill out options

class osx::dialogs::file_view_mode($mode = 'list') {

  include osx::finder

  validate_re($mode, '^(list|icon-grid)$', "osx::dialogs::file_view_mode[mode] must be one of the following: list, icon-grid; is ${mode}")

  $mode_code = $mode ? {
    icon-grid => 1,
    list => 2,
    default => 2,
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 1':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NavPanelFileListModeForOpenMode',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 2':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelFileListModeForOpenMode2',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 3':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelFileLastListModeForOpenModeKey',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 4':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelFileLastListModeForSaveModeKey',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 5':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelFileListModeForSaveMode2',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }

  boxen::osx_defaults { 'File Dialog File View Mode - Part 6':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NavPanelFileListModeForSaveMode',
    type   => 'int',
    value  => $mode_code,
    notify => Exec['killall Finder'],
  }
}
