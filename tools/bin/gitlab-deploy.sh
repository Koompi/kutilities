sudo docker run --detach --name gitlab \
	--hostname git.kosmos.org \
	--publish 30080:30080 \
         --publish 30022:22 \
	--env GITLAB_OMNIBUS_CONFIG="external_url 'http://git.kosmos.org:30080'; gitlab_rails['gitlab_shell_ssh_port']=30022;" \
	gitlab/gitlab-ce:9.1.0-ce.0

git clone https://github.com/IBM/Kubernetes-container-service-GitLab-sample.git gitlab

cd gitlab

sudo apt install docker-compose -y
docker-compose up -d

# change /etc/hosts

# 127.0.0.1 git.kosmos.org
