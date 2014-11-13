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

exec { 'install-gitlab':
	command => "wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb && dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb",
	timeout => 0,
}

include system-update
include system-upgrade
include tools_packages
