class vtools_install::linux 
	($file = "VMwareTools-9.0.15-2323214.tar") {

 	file { "VmwareTools":
           path => "/root/$file",
           source => "puppet:///modules/vtools_install/$file",
           ensure => present,

        }

        exec { "vmtools":
           command => "tar -xvf /root/$file",
           cwd => "/root",
           require => File["VmwareTools"],
           path => ["/bin/", "/usr/bin/"],
        }

        exec { "install":
          command => "perl vmware-install.pl",
          cwd => "/root/vmware-tools-distrib/",
          require => Exec["vmtools"],
          path => ["/usr/bin/"],
        }

}
