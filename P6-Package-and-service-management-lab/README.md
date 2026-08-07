Hello sudo apt update              # update the list of available packages
apt search nginx             # search for a package
sudo apt install nginx       # install a package
sudo apt remove nginx        # uninstall but keep configuration files
sudo apt purge nginx         # uninstall + remove configuration files

systemctl status nginx       # check the service status
sudo systemctl start nginx   # start the service
sudo systemctl stop nginx    # stop the service
sudo systemctl enable nginx  # start the service automatically at boot

Quick summary:

apt         # manage software/packages
systemctl   # manage system services
start       # start now
stop        # stop now
enable      # start automatically at system boot
remove      # uninstall
purge       # uninstall + remove configuration

For a GitHub Codespace, where systemctl may not be available:

sudo service nginx status    # check service status
sudo service nginx start     # start the service
sudo service nginx stop      # stop the service