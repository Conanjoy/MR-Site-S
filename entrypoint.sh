#!/bin/bash
env >> /etc/environment

nohup gunicorn keep_alive:app --bind 0.0.0.0:8080 --access-logfile - --error-logfile - &

cron -f
