# this class will install the salt-master and salt-minion
# example for site.pp:
#   include salt
#
class salt {
  include 'salt::master'
  include 'salt::minion'
}
