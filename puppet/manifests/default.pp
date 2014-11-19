Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'add-ubuntu-git-maintainers-repo':
	command => "add-apt-repository ppa:git-core/ppa",
}

class system-update {
	exec { 'apt-get update':
		command => 'apt-get update',
  }
}

class system-upgrade {
	exec { 'apt-get upgrade':
        	command => 'apt-get upgrade -y',
    }
}

class tools_packages {
	package { "git":
		ensure => "latest",
	}
}	
class ssh_package {
	package { "openssh-server":
                ensure => "latest",
        }
}

include system-update
include system-upgrade
include tools_packages
include gitlab
include gitlab-ctl-reconfigure
