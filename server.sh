USER=""


dnf install git cronie
dnf upgrade

eval "$(ssh-agent -s)"
ssh-keygen -t ed25519 -C "github" -f /.ssh/id_github
ssh-add /.ssh/id_github
cat /.ssh/id_github.pub

adduser $USER
usermod -aG sudo $USER
cp -R /root/.ssh /home/$USER/
chown -R $USER:$USER /home/$USER/.ssh

# 1. Remove any old/conflicting packages (safe to run even if nothing is installed)
sudo dnf remove docker docker-client docker-client-latest docker-common \
  docker-latest docker-latest-logrotate docker-logrotate docker-selinux \
  docker-engine-selinux docker-engine
# 2. Add the official Docker CE repo
sudo dnf config-manager addrepo \
  --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
# 3. Install Docker Engine + CLI + Compose plugin
sudo dnf install docker-ce docker-ce-cli containerd.io \
  docker-buildx-plugin docker-compose-plugin
# 4. Start & enable the service
sudo systemctl enable --now docker
# 5. Add your user to the docker group (no more sudo)
sudo usermod -aG docker $USER
# 6. Apply group change without logout (current shell only)
newgrp docker
# 7. Verify
docker --version
docker compose version
docker run hello-world
