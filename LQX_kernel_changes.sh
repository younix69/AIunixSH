sudo apt update -y
###Downloads NEW update KERNEL
sudo curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
####Created REMOVE OLD Script
touch /home/$user/rm_old_kernel.sh
sudo chmod +X /home/rm_old_kernel.sh
echo 'apt remove linux-header* -y' >> /home/$user/rm_old_kernel.sh
echo 'apt remove autoremove -y' >> /home/$user/rm_old_kernel.sh
echo 'crontab -r' >> /home/$user/rm_old_kernel.sh
### Manipulation CRONTAB AFTER REBOOT FUNCTION
sudo cp -i /etc/crontab /home/$user/
sed '/PATH=/a @reboot /home/$user/rm_old_kernel.sh /home/$user/crontab' /home/$user/crontab | xsel -i -b
sudo bash ; cd /home/*/ ; > crontab
echo "$(xsel -o -b)" >> /home/*/crontab
sudo cp -i /home/*/crontab /etc/

sudo reboot -y