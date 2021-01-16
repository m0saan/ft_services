openrc

touch /run/openrc/softlevel

rc-update add sshd

adduser -D admin

echo admin:admin | chpasswd

ssh-keygen -A

/usr/sbin/sshd -D