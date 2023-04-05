#!/bin/bash

source /etc/profile
cd /app

count=`ps -aux|grep "caddy"|wc -l`
echo $count

if [ $count -lt 2 ];then
    echo "start"
else
    echo "reload"
    caddy stop
fi
caddy run --config ~/Caddyfile

ln -s ~/admin /app/admin
ln -s ~/server /app/server
ln -s ~/frontend /app/frontend
#npm install

pm2 stop server && pm2 delete server
pm2 flush
pm2 start /app/server.js --name server --max-memory-restart 300M --cron-restart="0 3 * * *" -- --port 80

pm2 log