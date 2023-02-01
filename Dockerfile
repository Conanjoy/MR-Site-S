FROM reganqbbot/msr


# Download and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable && rm -rf /var/lib/apt/lists/* && rm -rf /etc/cron.*/*


# Add often-changed files in order to cache above
COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY crontab /etc/cron.d/crontab

RUN chmod 0644 /etc/cron.d/crontab

RUN crontab /etc/cron.d/crontab

# Make the entrypoint executable
RUN chmod +x entrypoint.sh

# Set the entrypoint to our entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["cron","-f", "-L", "2"]
