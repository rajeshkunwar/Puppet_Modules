class nginx_install::redhat7_install {

	file { '/etc/yum.repos.d/nginx.repo':
    		ensure => present,
    		source => 'puppet:///modules/nginx_install/redhat7/nginx.repo',
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
