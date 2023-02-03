#!/bin/bash
env >> /etc/environment

nohup python3 keep_alive.py > /proc/1/fd/1 2>/proc/1/fd/2 &

nohup python3 alive.py > /proc/1/fd/1 2>/proc/1/fd/2 &

service "$@"
