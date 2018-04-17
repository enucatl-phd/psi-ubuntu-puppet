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
  notify => Service["ntp"],
}

file { "/etc/cups/client.conf":
  source => "puppet:///modules/cups/client.conf",
  ensure => present,
  owner => "root",
  group => "root",
}

file { "/etc/openafs/cacheinfo":
  source => "puppet:///modules/afs/cacheinfo",
  ensure => present,
  owner => "root",
  group => "root",
  notify => Service["openafs-client"],
}

file { "/etc/openafs/ThisCell":
  source => "puppet:///modules/afs/ThisCell",
  ensure => present,
  owner => "root",
  group => "root",
  notify => Service["openafs-client"],
}

file { "/etc/krb5.conf":
  source => "puppet:///modules/afs/krb5.conf",
  ensure => present,
  owner => "root",
  group => "root",
}        

service { "ntp":
  ensure => running,
}

service { "openafs-client":
  ensure => running,
  require => Package["openafs-client", "openafs-krb5"],
}
