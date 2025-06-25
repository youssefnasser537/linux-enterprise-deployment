#!/bin/bash

# Backup script
sudo tee /usr/local/bin/backup_dept.sh > /dev/null << 'EOF'
#!/bin/bash
DATE=$(date +%F)
mkdir -p /backups
for dept in dev hr it sales; do
  tar -czf /backups/${dept}_${DATE}.tar.gz /srv/$dept
done
logger "Backup script executed successfully on $DATE"
EOF

sudo chmod +x /usr/local/bin/backup_dept.sh

# Cron job
echo "0 1 * * * root /usr/local/bin/backup_dept.sh" | sudo tee /etc/cron.d/backup_dept

#  at job
echo "wall 'System maintenance will occur tonight at 1:00 AM. Save your work!'" | sudo at 17:00
