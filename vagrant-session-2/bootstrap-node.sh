rm -rf /etc/yum.repos.d/epel*
yum clean all
yum repolist
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
chmod 400 /home/vagrant/playbooks/keys/vagrant
sudo yum repolist
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.29.2  client2
192.168.29.3  client1
192.168.29.4  ansible-host
