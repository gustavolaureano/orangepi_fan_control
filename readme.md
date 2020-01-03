
# OrangePi PC FAN Control

Fan is controlled thru PD14 GPIO

Make sure that the script is executable:

```
chmod +x fan_Control.sh
```

## For registering the systemd service, do the following:

create a symbolic link of the service file inside systemd/system folder:
```
ln -s /root/fan/fan.service /etc/systemd/system/fan.service
```


Install/enable the service, this will make systemd already start it on the next boot:
```
sudo systemctl enable fan.service
```


(optional) start the service
```
sudo systemctl start fan.service
```


check the service status
```
systemctl status fan.service
```


## Stress testing it

start 4 jobs to use CPU and keep then in background
```
for i in 1 2 3 4 ; do nice -n 20 cat /dev/zero > /dev/null & done 
```


kill all started jobs in background
```
for pid in $( jobs -p ) ; do kill -9 $pid ; done
```



You can find more detais in this blog post:
https://laureanogustavo.blogspot.com/2019/12/automatic-fan-control-on-orangepi-pc-or.html
