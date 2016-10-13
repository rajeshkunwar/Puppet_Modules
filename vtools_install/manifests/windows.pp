class vtools_install::windows 
	($file = "VMware-tools-10.0.9-3917699-x86_64.exe") {
	
	file { "VmwareTools":
           path => "C:/$file",
           source => "puppet:///modules/vtools_install/$file",
           ensure => present,
	   source_permissions => "ignore",
        }
	
	exec { "vmwaretools":
	   command => 'C:\\Windows\System32\cmd.exe msiexec.exe "C:\$file" /s /v/qn',
	   require => File["VmwareTools"],
	}
	   
}
