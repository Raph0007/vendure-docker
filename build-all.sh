HOST_IP=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
docker build vendure-server -t vendure-server-docker
docker build vendure-storefront-remix -t vendure-storefront-remix-docker --build-arg VENDURE_SERVER_HOST="$HOST_IP"
docker build vendure-storefront-vue -t vendure-storefront-vue-docker --build-arg VENDURE_SERVER_HOST="$HOST_IP"