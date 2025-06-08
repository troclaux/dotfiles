sudo systemctl restart bluetooth

sudo modprobe -r hid_playstation
sudo modprobe hid_playstation

sudo modprobe -r hid_sony
sudo modprobe hid_sony

# sudo bash -c 'echo "options bluetooth disable_ertm=Y" > /etc/modprobe.d/bluetooth.conf'
