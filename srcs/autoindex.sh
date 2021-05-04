if [ "$autoindex" = "on" ]
then
	export autoindex=off
	sed -i -e 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/nginx.conf
else
	export autoindex=on
	sed -i -e 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/nginx.conf
fi
service nginx reload
echo "Autoindex is $autoindex"

