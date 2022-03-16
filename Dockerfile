FROM rmeiradev/php8.1-cli-alpine-swoole-dev

# COPY CRONTAB CONFIGS
COPY ./crontabs/cron /etc/cron
RUN chmod 0644 /etc/cron && crontab /etc/cron

# COPY SUPERVISOR CONFIG
COPY ./supervisor/supervisord.conf /etc/supervisord.conf

# COPY SHELLSCRIPT
COPY ./scripts/init.sh /scripts/init.sh
RUN chmod +x /scripts/init.sh

EXPOSE 8000

ENTRYPOINT ["/scripts/init.sh"]