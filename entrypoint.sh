#!/bin/bash
env >> /etc/environment

nohup gunicorn keep_alive:app --bind 0.0.0.0:8080 --access-logfile - --error-logfile - &

python3 ms_rewards_farmer.py --session --headless --fast --telegram "${TOKEN}" "${CHAT_ID}" &

cron -f
