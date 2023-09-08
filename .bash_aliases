export GITPROJECTS=/home/GitProjects
export STACK_CONFIG=$GITPROJECTS/stack-config
export SWARM_DEPLOY=$STACK_CONFIG/swarm-deploy
export SWARM_DEPLOY_PROD=$STACK_CONFIG/swarm-deploy-prod
export PATH=$PATH:/var/lib/google/dists:$STACK_CONFIG/dists:$STACK_CONFIG

mkdir -p /tmp/composer-cache
mkdir -p /tmp/npm-cache

alias composer='docker run --rm -it -v "$PWD":/app -v /tmp/composer-cache:/tmp/cache -w /app --network dev_tools-net nathanaelytj/composer-custom'
alias npm='docker run --rm -it -v "$PWD":/app -v /tmp/npm-cache:/root/.npm -w /app --network dev_tools-net nathanaelytj/npm-custom npm'
alias npx='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net nathanaelytj/npm-custom npx'
alias ionic='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net nathanaelytj/npm-custom ionic'
alias vite='docker stop vite_server ; docker run --rm -it -d -v "$PWD":/app -w /app -p 5173:5173 --network dev_tools-net --name vite_server nathanaelytj/npm-custom npm run dev'
alias vite-serve='docker stop vite_preview ; docker run --rm -it -d -v "$PWD":/app -w /app -p 4173:4173 --network dev_tools-net --name vite_preview nathanaelytj/npm-custom npm run serve'
alias php='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net ghcr.io/ntj125app/openlitespeed:latest php'
alias php-oci='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net ghcr.io/ntj125app/openlitespeed:php-oci php'
alias test-php='php artisan test'
alias test-php-oci='php-oci artisan test'
alias pint='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net ghcr.io/ntj125app/openlitespeed:latest php ./vendor/bin/pint'
alias deps-up='composer up -W --ignore-platform-reqs ; npm up'
alias deps-install='composer install --ignore-platform-reqs ; npm i'
alias mobile-up='npm up ; npx vite build ; npx cap sync'
alias mobile-install='npm i ; npx vite build ; npx cap sync'
alias local-up='cat .env | base64 > base64_env_local'
alias dev-up='cat env-dev | base64 > base64_env_dev'
alias prod-up='cat env-production | base64 > base64_env'
alias python='docker run --rm -it -v "$PWD":/app -v /home/python-site-packages:/usr/local/lib/python3.11/site-packages -w /app --network dev_tools-net python:alpine python'
alias pip='docker run --rm -it -v "$PWD":/app -v /home/python-site-packages:/usr/local/lib/python3.11/site-packages -w /app --network dev_tools-net python:alpine pip'
alias flutter='docker run --rm -it -v "$PWD":/app -w /app --network dev_tools-net ghcr.io/ntj125app/flutter-cli:latest'
