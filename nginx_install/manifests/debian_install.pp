class nginx_install::debian_install {

	file { '/etc/apt/sources.list.d/nginx.list':
		ensure => present,
		before => Exec['nginx.list'],
	}
	
	exec {'nginx.list':
		command => ['echo "deb http://nginx.org/packages/ubuntu/ $operatingsystemrelease nginx >> /etc/apt/sources.list.ngix.list"'],
		path => ['/bin/'],
#	file_line { 'nginx.list':
#		path => '/etc/apt/sources.list.d/nginx.list',
#		line => 'deb http://nginx.org/packages/ubuntu/ $operatingsystemrelease nginx',
#	}
	}	
	
	package { 'nginx':
		ensure => 'installed',
		provider => 'apt',
		notify => Service['nginx'],
	}
	
	service { 'nginx':
		ensure => 'running',
	}
	

}
