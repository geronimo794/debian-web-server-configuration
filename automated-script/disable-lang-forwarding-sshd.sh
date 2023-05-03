# Comment out the line on /etc/ssh/sshd_config
# AcceptEnv LANG LC_*
sudo sed -i 's/AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/' /etc/ssh/sshd_config
sudo systemctl restart sshd
