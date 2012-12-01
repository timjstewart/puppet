class scala {
	package { 
		'scala':
			ensure => installed,
	}

	$sbt_version='0.12.1'

	$deb_url ="http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/${sbt_version}/sbt.deb"

	exec {
		"Install sbt":
			path    => '/usr/bin',
			command => "wget $deb_url && sudo dpkg -i sbt.deb",
			cwd     => '/tmp',
			unless  => 'which sbt',
			require => [Package['wget']];
	}
}
