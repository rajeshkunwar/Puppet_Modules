class nginx_install::redhat5_install {
	file { '/etc/yum.repos.d/nginx.repo':
		ensure => present,
		source => 'puppet:///modules/nginx_install/redhat5/nginx.repo',
		before => Package['nginx'],
	}

	package { 'nginx':
		ensure => 'installed',
		notify => Service['nginx'],
	}	

	service { 'nginx':
		ensure => 'running',
	}
}	 
