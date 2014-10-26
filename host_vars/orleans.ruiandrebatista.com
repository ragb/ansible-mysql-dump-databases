mysql_unix_backup_user: backup

mysql_admin_user: root
mysql_admin_password: MFa.,240 # Define this

mysql_backup_host: localhost
mysql_backup_user: backup
mysql_backup_password: martaBuga # define this.

mysql_backup_path: /home/{{mysql_backup_user}}/mysql-backups
mysql_backup_databases: # Redefine this
  - tipa_drupal
  - ragb_megatts
  - ragb_drupal_apec
  - nvda_pt
  - mailserver
  - ragb_wp_personal


# See special_time entry for possible values:
# http://docs.ansible.com/cron_module.html
mysql_backup_cron_time: daily

mysql_backup_remove_databases: [] # Removes from crontab


mysql_dump_path: /home/ragb/mysql_dumps/

mysql_dump_databases:
  - tipa_drupal
  - ragb_megatts
  - ragb_drupal_apec
  - nvda_pt
  - ragb_wp_personal
