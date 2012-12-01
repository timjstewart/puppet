node default {
	# installs the essentials (e.g. vim, git, zsh, wget, sudo)
	include base

	# keep the time in sync
	include ntp

	include gplusplus
	include ruby1_9
	include jruby
	include scala
	include ant
	include maven2
	include clojure1_4
	include haskell_platform
	include mongodb
}

