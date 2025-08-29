# Basis-Image mit Java 21
FROM openjdk:21-jdk-slim

# Arbeitsverzeichnis setzen
WORKDIR /data

# Optional: gettext-base für envsubst (falls Variablen in server.properties ersetzt werden sollen)
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Entrypoint-Script hinzufügen
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Standard-Port
EXPOSE 25565

# Volume für persistente Daten
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]
