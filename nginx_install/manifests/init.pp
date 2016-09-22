class nginx_install {

	if $osfamily == 'RedHat' {
		if $operatingsystemmajrelease == 6 {
			include nginx_install::redhat6_install
		}
		elsif $operatingsystemmajrelease == 5 {
			include nginx_install::redhat5_install
		}
		elsif $operatingsystemmajrelease == 7 {
			include nginx_install::redhat7_install
		}
		else {
			notice("Not Supported")
		}
	}
	elsif $osfamily == 'Debian' {
		include nginx_install::debian_install
	}
	else {
		notice("OS not supported")
	}
	
}
