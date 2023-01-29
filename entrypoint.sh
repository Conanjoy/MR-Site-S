#!/bin/bash
env >> /etc/environment

echo "$@"
exec "$@"
ls

python3 alive.py
