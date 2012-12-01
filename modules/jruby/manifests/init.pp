class jruby {
	package { 
		'jruby':
			ensure => installed,
	}

	exec {
		'install rspec':
			path    => '/usr/bin:/usr/lib/jruby/bin',
			command => 'jruby -S gem install jruby-openssl rspec-core',
			cwd     => '/tmp',
			unless  => 'which rspec';
	}
}
