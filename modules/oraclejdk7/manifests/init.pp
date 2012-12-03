class oraclejdk7 {
	file {
		'/usr/lib/oraclejdk7':
			ensure => directory;

		'/etc/puppet/files':
			ensure => directory;

		'/etc/puppet/files/jdk-7u9-linux-x64.tar.gz':
			ensure => directory,
			mode   => 440,
			owner  => root,
			group  => root,
			source => 'puppet:///files/jdk-7u9-linux-x64.tar.gz';
	}

	exec {
		'unpack jdk':
			path => '/usr/bin:/bin',
			creates => '/usr/bin/jdk1.7.0_09',
			command => 'tar xvzf /etc/puppet/files/jdk-7u9-linux-x64.tar.gz -C /usr/bin';
	}

	file {
		'/usr/bin/jdk':
			ensure => target,
			target => '/usr/bin/jdk1.7.0_09';
	}
}
