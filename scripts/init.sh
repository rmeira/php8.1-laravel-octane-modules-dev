#!/bin/sh

composer install
npm install --save-dev chokidar
php artisan optimize

exec /usr/bin/supervisord  -c /etc/supervisord.conf
