# # Java 21 environment for Minecraft server
FROM openjdk:21-jdk-slim

# Working directory in the container
WORKDIR /data

# Instal gettext-base for envsubst
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Copy all files to the working directory
COPY . $WORKDIR

# Default Minecraft server port
EXPOSE 25565

# Volume for persistent data
VOLUME ["/data"]

# Start the Minecraft server using the start script
ENTRYPOINT ["/entrypoint.sh"]