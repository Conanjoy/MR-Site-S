#!/bin/bash
env >> /etc/environment

python3 keep_alive.py &

python3 alive.py > /proc/1/fd/1 2>/proc/1/fd/2 &

echo "$@" &

exec "$@"
