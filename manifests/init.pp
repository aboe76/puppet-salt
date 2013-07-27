class salt {
  case $::osfamily {
    'archlinux' : {
      include 'salt::master'
      include 'salt::minion'

    }

    default     : {
      include 'salt::master'
      include 'salt::minion'
    }

  }

}
