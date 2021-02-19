openrc

touch /run/openrc/softlevel

rc-update add sshd

adduser -D admin

echo admin:admin | chpasswd

ssh-keygen -R 192.168.99.124

/usr/sbin/sshd -D
