#sudo su
mv /etc/yum.repos.d/fedora.repo fedora.repo.bak
mv /etc/yum.repos.d/fedora-updates.repo fedora-updates.repo.bak
wget -O /etc/yum.repos.d/fedora.repo http://mirrors.aliyun.com/repo/fedora.repo
wget -O /etc/yum.repos.d/fedora-updates.repo http://mirrors.aliyun.com/repo/fedora-updates.repo
dnf clean all
dnf makecache

