Set-Variable HOST_IP (Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred | Where-Object -FilterScript { ($_.InterfaceAlias -Notlike "*WSL*") -and ($_.InterfaceAlias -Notlike "*Loopback*") }).IPAddress
Write-Output "IP for Vendure Server determined as $HOST_IP"
docker build vendure-server -t vendure-server-docker
docker build vendure-storefront-remix -t vendure-storefront-remix-docker --build-arg VENDURE_SERVER_HOST=$HOST_IP
docker build vendure-storefront-vue -t vendure-storefront-vue-docker --build-arg VENDURE_SERVER_HOST=$HOST_IP
docker build vendure-storefront-nextjs -t vendure-storefront-nextjs-docker --build-arg VENDURE_SERVER_HOST=$HOST_IP
docker build vendure-storefront-angular -t vendure-storefront-angular-docker --build-arg VENDURE_SERVER_HOST=$HOST_IP