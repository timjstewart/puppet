class user {
	file {
		'/home/tim':
			ensure => directory;

		'/home/tim/.bashrc':
			ensure => file,
			mode   => 440,
			owner  => tim,
			group  => tim,
			source => 'puppet:///files/.bashrc';

		'/home/tim/.zshrc':
			ensure => file,
			mode   => 440,
			owner  => tim,
			group  => tim,
			source => 'puppet:///files/.zshrc';
	}
}
