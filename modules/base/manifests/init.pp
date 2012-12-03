class base {
	package { 
		'curl':
			ensure => installed;
		'sudo':
			ensure => installed;
		'wget':
			ensure => installed;
		'zsh':
			ensure => installed;
		'vim':
			ensure => installed;
		'git':
			ensure => installed;
	}

	file {
		'/home/tim/.gitconfig':
			ensure => file,
			mode   => 440,
			owner  => tim,
			group  => tim,
			source => 'puppet:///files/.gitconfig';
	}
}
