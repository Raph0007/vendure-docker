# vendure-docker

Docker containers for Vendure and the different storefronts

## Building and Running

### Prerequisites

- These containers have been tested on Windows and on Linux, but they should also work on macOS.
- On Windows, PowerShell is required to run the buildscript (`build-all.ps1`)
- Docker has to be installed and the docker daemon needs to run before you can execute the buildscript. In particular,
  both `docker` (and subcommands) as well as `docker compose` (and subcommands) need to be available.
- Some containers need to know the address of the machine on which the vendure server will run (can also be just
  an IP). The buildscripts aid with this by assuming the vendure-server container will be _built_ and _run_ on the same
  machine. However, the retrieval of the IP address of that machine is still just a heuristic at best (because you can
  have multiple network interfaces in use on your machine). If the method used in the buildscripts does not yield the
  correct IP address, or if you build and run on different machines, you have to replace the first line of the
  buildscript with
    - `Set-Variable HOST_IP <your-ip-address>` on Windows (`build-all.ps1`)
    - `HOST_IP=<your-ip-address>` on Linux (`build-all.sh`)

### Building

To build all containers (Vendure Server and all storefronts), you just need to run `build-all.ps1` (on Windows)
or `build-all.sh` (on Linux). The script has to be run in the root directory of this repository.

This process of using the buildscript for building all containers is most suitable if you intend to build and run all
containers on the same machine.

### Running

To run all containers at once (for example, to compare storefronts), you can just open a terminal and
run `docker compose up` in the root directory of this repository (or wherever `docker-compose.yml` resides).

This will start up the vendure server and all storefronts as separate services (see below, Images) and also create a
docker network called `vendure-network`.

## Images

### 1. Vendure Server

The Vendure Server docker image (called `vendure-server-docker` by the buildscript) is built from the Dockerfile
in `/vendure-server`. It is later used to start the `vendure-server` service from the compose file.

This container runs [Vendure](https://www.vendure.io/) as a server application, also exposing the Admin UI.

Vendure Server will be started on port 3010, you can check if it's working by accessing `http://localhost:3010/admin`
(which will show you the Admin UI).

### 2. Vendure Storefront Remix

The Vendure Storefront Remix docker image (called `vendure-storefront-remix-docker` by the buildscript) is built from
the Dockerfile in `/vendure-storefront-remix`. It is later used to start the `vendure-storefront-remix` service from the
compose file.

This container runs the [Remix Storefront for Vendure](https://github.com/vendure-ecommerce/storefront-remix-starter) as
a storefront for the vendure server.

The storefront will be started on port 3000, you can check if it's working by accessing `http://localhost:3000` (which
will show the storefront).

### 3. Vendure Storefront Vue

The Vendure Storefront Vue docker image (called `vendure-storefront-vue-docker` by the buildscript) is built from the
Dockerfile in `/vendure-storefront-vue`. It is later used to start the `vendure-storefront-vue` service from the compose
file.

This container runs the [Vue Storefront for Vendure](https://docs.vuestorefront.io/vendure/) as a storefront for the
vendure server.

This storefront will be started on port 3001, you can check if it's working by accessing `http://localhost:3001` (which
will show the storefront).

### [TODO] Vendure Storefront NextJS

### [TODO] Vendure Storefront Angular