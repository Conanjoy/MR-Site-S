#!/bin/bash
env >> /etc/environment

exec gunicorn keep_alive:app --bind 0.0.0.0:8080 &

python3 alive.py &

echo "$@"

exec "$@"
