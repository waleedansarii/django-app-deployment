#!/bin/bash

<< task
Deploy a django app 
and handle the code for errors
task

install_req()
{
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

req_restarts()
{
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable nginx
	sudo systemctl restart nginx
}

deploy()
{
	docker-compose down
	docker-compose up -d
}

echo "******* DEPLOYMENT STARTED ********"

if ! install_req; then
	echo "Installation failed"
	exit 1
fi

if ! req_restarts; then 
	echo "System fault identified"
	exit 1
fi

if ! deploy; then 
	echo "Deployment failed, mailing the admin"
	# sendmail
	exit 1
fi

echo "******* DEPLOYMENT DONE *******"

