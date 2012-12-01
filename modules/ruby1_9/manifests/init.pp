class ruby1_9 {

	package { 
		'ruby1.9.1-full':
			ensure => installed;

		'ruby1.9.1-dev':
			ensure => installed;

		'rails':
			ensure   => installed,
			provider => gem;

		'sinatra':
			ensure   => installed,
			provider => gem;
	}
}
