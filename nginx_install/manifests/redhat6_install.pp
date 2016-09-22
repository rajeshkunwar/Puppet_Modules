class nginx_install::redhat6_install {


	file { '/etc/yum.repos.d/nginx.repo':
    		ensure => present,
    		source => 'puppet:///modules/nginx_install/redhat6/nginx.repo',
	}

	package { 'nginx':
    		ensure => 'installed',
   	 	notify => Service['nginx'],
		require => File['/etc/yum.repos.d/nginx.repo'],
	}

	service { 'nginx':
    		ensure => 'running',
		
	}

}
