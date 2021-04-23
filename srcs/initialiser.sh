#phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7    /phpMyAdmin-4.9.7-all-languages.tar.gz \
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz \
mv phpMyAdmin-4.9.7-all-languages/ /usr/share/phpm    yadmin \
 mkdir -p /var/lib/phpmyadmin/tmp \
 chown -R www-data:www-data /var/lib/phpmyadmin \
 cp /usr/share/phpmyadmin/config.sample.inc.php /us    r/share/phpmyadmin/config.inc.php
