FROM reganqbbot/msr:latest

# Set default environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="America/New_York"

# Create working directory and relevant dirs
WORKDIR /app
RUN chmod 777 /app

# Install deps from APT
RUN apt-get update && apt-get install -y \
  && rm -rf /etc/cron.*/*

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata


# Download and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable && rm -rf /var/lib/apt/lists/*


# Make the entrypoint executable
RUN chmod +x entrypoint.sh

# Set the entrypoint to our entrypoint.sh

CMD ["bash", "entrypoint.sh"]

#END