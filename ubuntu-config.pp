package { ["libpam-krb5",
  "openafs-client",
  "openafs-krb5",
  "kstart",
  "libpam-afs-session",
  "ntp",
]:
  ensure => present,
  before => File["/etc/krb5.conf", "/etc/openafs/ThisCell"]
}

file { "/etc/ntp.conf":
  source => "puppet:///modules/afs/ntp.conf",
  ensure => present,
  owner => "root",
  group => "root",
}

file { "/etc/openafs/cacheinfo":
  source => "puppet:///modules/afs/cacheinfo",
  ensure => present,
  owner => "root",
  group => "root",
}

file { "/etc/openafs/ThisCell":
  source => "puppet:///modules/afs/ThisCell",
  ensure => present,
  owner => "root",
  group => "root",
}

file { "/etc/krb5.conf":
  source => "puppet:///modules/afs/krb5.conf",
  ensure => present,
  owner => "root",
  group => "root",
}        
