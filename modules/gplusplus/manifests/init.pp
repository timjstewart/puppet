class gplusplus {
	package { 
		'g++-4.7':
			ensure => installed;

		'valgrind':
			ensure => installed;

		'libzmq-dev':
			ensure => installed;

		'gdb':
			ensure => installed;
	}
}
