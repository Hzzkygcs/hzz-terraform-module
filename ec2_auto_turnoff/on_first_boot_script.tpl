#!/bin/bash
# hashbang above seems to be important, because on some instance, the default interpreter is python
# see https://stackoverflow.com/a/69225044/7069108

#script_path="/home/ec2-user/on_reboot.sh"
script_path="/usr/local/sbin/notifyRemote.sh"
echo "$script_path"
echo "$script_path"
echo "$script_path"
echo "${automatic_turn_off_script_content_in_base64}" | base64 --decode | sudo tee "$script_path"
sudo chmod +x "$script_path"


# credit https://stackoverflow.com/q/39871883/7069108
echo "$(cat << EndOfMessage
[Unit]
Description=NandaGopal
Documentation=https://google.com
After=multi-user.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/sbin/notifyRemote.sh

[Install]
RequiredBy = multi-user.target
EndOfMessage
)" | sudo tee /etc/systemd/system/startup.service

sudo chmod +x /etc/systemd/system/startup.service


sudo systemctl enable startup.service
sudo systemctl start startup.service
sudo systemctl is-enabled startup.service
