class gitlab {

        exec { "install-gitlab":
                command => "dpkg -s gitlab 2>/dev/null >/dev/null || wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb && dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb",
		timeout => 0,
        }

        file { 'gitlab.rb':
        path    => '/etc/gitlab/gitlab.rb',
        ensure  => file,
        content => template("gitlab/gitlab.rb"),
      }

}

class gitlab-ctl-reconfigure {
        require gitlab
	exec { "gitlab-ctl-reconfigure":
                command => "gitlab-ctl reconfigure",
        }
}
