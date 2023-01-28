#!/bin/bash
env >> /etc/environment
python3 keep_alive.py && python3 alive.py
