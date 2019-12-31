#!/bin/bash

echo 110 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio110/direction

th_on=60
th_off=50

echo $(date)" FAN Control (1.0) >> ON: $th_on / OFF: $th_off"

clean_up() {

	# Perform program exit housekeeping
	echo 0 > /sys/class/gpio/gpio110/value
	echo 110 > /sys/class/gpio/unexport
	echo $(date)" FAN Control terminated."
	exit
}

trap clean_up INT TERM

while [ "1" = "1" ]
do
temp=`cat /sys/devices/virtual/thermal/thermal_zone0/temp | cut -c1-2`
state=`cat /sys/class/gpio/gpio110/value`

# echo "Temperature: $temp"
if [ $temp -ge $th_on ]
then
if [ $state = 0 ]
then
echo $(date)" Fan started: $temp"
echo 1 > /sys/class/gpio/gpio110/value
fi
elif [ $temp -le $th_off ]
then
if [ $state = 1 ]
then
echo $(date)" Fan stopped: $temp"
echo 0 > /sys/class/gpio/gpio110/value
fi
fi
sleep 2
done
