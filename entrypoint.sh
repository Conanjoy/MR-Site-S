#!/bin/bash
env >> /etc/environment

echo "$@"
exec "$@"

python3 alive.py
