class base {
	package { 
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

	exec {
		"configure git":
			command => 'git config --global user.name "Tim Stewart" && git config --global user.email tim.j.stewart@gmail.com && git config --global color.ui true',
			path    => '/usr/bin',
	}
}
