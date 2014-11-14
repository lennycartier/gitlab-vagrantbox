class gitlab {

	exec { "install-gitlab":
        	command => "wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb && dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb",
        	timeout => 0,
	}
}
