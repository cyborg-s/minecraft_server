# # Java 21 environment for Minecraft server
FROM openjdk:21-jdk-slim

# Working directory in the container
WORKDIR /app

# Instal gettext-base for envsubst
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Copy all files to the working directory
COPY . $WORKDIR

# Accept Minecraft EULA
RUN echo "eula=true" > /app/eula.txt


RUN chmod +x /app/entrypoint.sh

# Default Minecraft server port
EXPOSE 25565


# Start the Minecraft server using the start script
ENTRYPOINT ["/app/entrypoint.sh"]