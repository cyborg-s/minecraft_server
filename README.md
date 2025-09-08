# Minecraft Server Container Setup

This repository serves as a guide for containerizing a simple **Minecraft server: Java Edition** with **Docker Compose**.  
  
This repository was created as part of my continuing education at the Developer Academy.


## Table of Contents

1. [Prerequisites](#prerequisites)  
2. [Description](#description)
3. [Quickstart](#quickstart)
4. [Usage](#usage) 
5. [Note](#note)


## Prerequisites
   * **Docker**
   * **Minecraft Server Java Edition** [Download](https://www.minecraft.net/de-de/download/server)


## Description

### Minecraft 

Minecraft is a sandbox-based video game in which players can collect resources, build structures and experience adventures in an open world.

### Minecraft server

The Minecraft server serves as an environment that allows players to play Minecraft in online multiplayer and interact with others.
It also stores the shared progress of the world for all the players. 


### Folder structure 
```
minecraft-server/
├── Dockerfile
├── docker-compose.yml
├── entrypoint.sh
├── .env
├── server.properties
└── data/
   └── server.jar
```

## Quickstart

This section gives brief and minimal instructions on how to use the setup. more in-depth instructions can be found in the [Usage](#usage) section.

1. Clone the project to your platform:

   ```bash
   git clone git@github.com:cyborg-s/minecraft_server.git
   ```
 
   
2. Download the Java server file from the Official website and drop it in the data folder, is not Includes in the Repository:

   ```bash
   https://www.minecraft.net/de-de/download/server
   ```


3. Build and start the container in the background:

   ```bash
   docker compose up --build -d
   ```
    >[!NOTE]
    > Under windows you have to make sure that the file format from entrypoint is set to LF and not CRLF

4. Check whether the server is running correctly:

   * You can connect to the server with your copy of **Minecraft Java Edition** with the ip address and port :8888 

   OR

   * You can check your server is online using the website [mcstatus.io](https://mcstatus.io/)




## Usage

* Navigate to the project directory:

   ```bash
   cd minecraft_server
   ```

* Make the file executable if necessary:

   ```bash
   chmod +x server.jar
   ```

* Create the `.env` file from the template and edit your own settings:
   
   ```bash 
   cp example.env .env
   ``` 

   Edit your settings:

   ```bash
   nano .env
   ```

   Example settings:

    ```env
    MAX_PLAYERS=10
    LEVEL_SEED=4025804172371830787
    VIEW_DISTANCE=10
    ```

* Manage the container:
  
  * show the log files:
  ```bash
  docker compose logs -f
  ```

  * stop the container:
  ```bash
  docker compose stop <CONTAINER_NAME>
  ```

  * delete the container:
  ```bash
  docker compose down <CONTAINER_NAME>
  ```

  * list all containers that are operatet by Docker Compose:
  ```bash
  docker compose ps
  ```


### Files
1. The [`Dockerfile`](/Dockerfile) describes how a single Docker image should be created. It serves as the basis for a service in the Docker Compose file.

2. The [`compose.yml`](compose.yml) is responsible for managing and orchestrating the Minecraft Server container. It defines what configurations it should have.

3. The [`server.properties`](server.properties.temp) file plays a central role in setting up a Minecraft Java server. It contains the configuration options that allow you to customize the behavior of the server, the game rules and the technical characteristics.
 >[!NOTE]
 >* You can read about which properties can be changed [here](https://minecraft.wiki/w/Server.properties).




## Note
The [Minecraft Wiki](https://minecraft.wiki/w/Tutorial:Setting_up_a_server#Docker) offers a setup for this but points out that the contents of this setup are not supported by Mojang Studios or the Minecraft Wiki.
