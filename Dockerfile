# Use an Ubuntu base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    procps \
    systemctl \
    iputils-ping \
    rsync \
    sudo \
    tar \
    man-db \
    iproute2

# Copy the project files into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Make the script executable
RUN chmod +x /app/sysopctl

#copy man page to the appropriate directory
RUN mkdir -p /usr/share/man/man1/
COPY man/man1/sysopctl.1 /usr/share/man/man1/

# Run the script (you can change this to test different commands)
CMD ["tail", "-f", "/dev/null"]