#!/bin/bash
set -e

# EULA erzwingen
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

echo "Starting Minecraft server with JVM_OPTS=$JVM_OPTS..."
exec java $JVM_OPTS -jar /data/server.jar nogui
