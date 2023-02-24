HOST_IP=$(hostname -I)
echo "IP for Vendure Server determined as $HOST_IP"
docker build vendure-server -t vendure-server-docker
docker build vendure-storefront-remix -t vendure-storefront-remix-docker --build-arg VENDURE_SERVER_HOST="$HOST_IP"
docker build vendure-storefront-vue -t vendure-storefront-vue-docker --build-arg VENDURE_SERVER_HOST="$HOST_IP"