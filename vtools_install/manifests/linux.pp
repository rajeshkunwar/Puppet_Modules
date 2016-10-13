class vtools_install::linux 
	($file = "VMwareTools-9.0.15-2323214.tar") {

 	file { "VmwareTools":
           path => "/root/$file",
           source => "puppet:///modules/vtools_install/$file",
           ensure => present,

        }
		
	file { "answers.txt":
	   path => "/root/answers.txt",
	   source => "puppet:///modules/vtools_install/answers.txt",
	   ensure => present,
	}

        exec { "vmtools":
           command => "tar -xvf /root/$file",
           cwd => "/root",
           require => File["VmwareTools"],
           path => ["/bin/", "/usr/bin/"],
        }

	file { "VmwareTools.tar":
	   path => "/root/$file"
	   ensure => absent,
	   require => Exec["vmtools"]	
	}

        exec { "install":
          command => "perl vmware-install.pl < /root/answers.txt",
          cwd => "/root/vmware-tools-distrib/",
          require => Exec["vmtools"],
          path => ["/usr/bin/"],
        }

}
