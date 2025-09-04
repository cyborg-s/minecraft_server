#!/bin/sh

# EULA enforce
if [ "${EULA}" != "TRUE" ]; then
  echo "ERROR: You must accept the EULA by setting EULA=TRUE in .env"
  exit 1
fi
echo "eula=true" > /data/eula.txt

# Check server.jar
if [ ! -f /data/server.jar ]; then
  echo "No server.jar found in ./data. Please put your server.jar into ./data directory."
  exit 1
fi

# Default JVM options
: "${JVM_OPTS:=-Xms1G -Xmx1G}"

# Default for Minecraft variables
: "${MOTD:=Welcome to Minecraft!}"
: "${MAX_PLAYERS:=20}"
: "${WHITE_LIST:=false}"
: "${LEVEL_SEED:=}"

# generate the server.properties
if [ -f /server.properties.temp ]; then
  envsubst < /server.properties.temp > /data/server.properties
  echo "Generated server.properties with defaults (if not provided in .env)."
fi

echo "Starting Minecraft server with JVM_OPTS=$JVM_OPTS..."
exec java $JVM_OPTS -jar /data/server.jar nogui
