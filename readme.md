
# OrangePi PC FAN Control

Fan is controlled thru PD14 GPIO

Make sure that the script is executable:

chmod +x fan_Control.sh

For registering the systemd service, do the following:

create a symbolic link of the service file inside systemd/system folder:
  ln -s /root/fan/fan.service /etc/systemd/system/fan.service

Install/enable the service, this will make systemd already start it on the next boot
  sudo systemctl enable fan.service

(optional) start the service 
  sudo systemctl start fan.service

check the service status
  systemctl status fan.service


You can find more detais in this blog post:
https://laureanogustavo.blogspot.com/2019/12/automatic-fan-control-on-orangepi-pc-or.html
