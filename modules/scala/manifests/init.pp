class scala {
	$scala_version = '2.10.0-RC3'
	$akka_version  = '2.1.0-RC3'
	$play_version  = '2.0.4'

	file {
		'/home/tim/bin':
			owner  => tim,
			group  => tim,
			ensure => directory;

		'/etc/puppet/files/scala':
			ensure => directory;

		"/etc/puppet/files/scala/scala-${scala_version}.tgz":
			ensure => directory,
			mode   => 440,
			owner  => root,
			group  => root,
			source => "puppet:///files/scala-${scala_version}.tgz";

		"/etc/puppet/files/scala/akka-${akka_version}.tgz":
			ensure => directory,
			mode   => 440,
			owner  => root,
			group  => root,
			source => "puppet:///files/akka-${akka_version}.tgz";

		"/etc/puppet/files/scala/play-${play_version}.zip":
			ensure => directory,
			mode   => 440,
			owner  => tim,
			group  => tim,
			source => "puppet:///files/play-${play_version}.zip";
	}

	exec {
		'unpack scala':
			path    => '/usr/bin:/bin',
			creates => "/usr/bin/scala-${scala_version}",
			command => "tar xvzf /etc/puppet/files/scala/scala-${scala_version}.tgz -C /usr/bin";

		'unpack akka':
			path    => '/usr/bin:/bin',
			creates => "/usr/bin/akka-${akka_version}",
			command => "tar xvzf /etc/puppet/files/scala/akka-${akka_version}.tgz -C /usr/bin";

		'unpack play':
			user    => tim,
			path    => '/usr/bin:/bin',
			creates => "/home/tim/bin/play-${play_version}",
			command => "unzip /etc/puppet/files/scala/play-${play_version}.zip -d /home/tim/bin";
	}

	file {
		'/usr/bin/scala':
			ensure => target,
			target => "/usr/bin/scala-${scala_version}";

		'/usr/bin/akka':
			ensure => target,
			target => "/usr/bin/akka-${akka_version}";

		"/home/tim/bin/play-${play_version}":
			owner  => tim,
			group  => tim;

		'/home/tim/bin/play':
			owner  => tim,
			group  => tim,
			ensure => target,
			target => "/home/tim/bin/play-${play_version}";
	}

	# $sbt_version='0.12.1'

	# $deb_url ="http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/${sbt_version}/sbt.deb"

	# exec {
	# 	"Install sbt":
	# 		path    => '/usr/bin',
	# 		command => "wget $deb_url && sudo dpkg -i sbt.deb",
	# 		cwd     => '/tmp',
	# 		unless  => 'which sbt',
	# 		require => [Package['wget']];
	# }
}
