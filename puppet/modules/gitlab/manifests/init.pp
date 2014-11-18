class gitlab {

	$once_lock = "/var/lock/puppet-once"

        exec { "install-gitlab":
                command => "wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb && dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb",
		creates => once_lock,
                timeout => 0,
        }

        file { 'gitlab.rb':
        path    => '/etc/gitlab/gitlab.rb',
        ensure  => file,
        content => template("gitlab/gitlab.rb"),
      }

}
