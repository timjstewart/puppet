node default {
	include user

	# installs the essentials (e.g. vim, git, zsh, wget, sudo)
	include base

	# keep the time in sync
	include ntp

	include gplusplus
	include ruby1_9
	include haskell_platform
	include mongodb

	# Java classes
	include oraclejdk7
	include scala
	#include jruby
	#include ant
	#include maven2
	#include clojure1_4
}

