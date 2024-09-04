FROM nginx:mainline-alpine

RUN apk add --no-cache \
    git \
    npm \
    ca-certificates

# init phanpy
RUN git clone -b main https://github.com/cheeaun/phanpy.git /app
WORKDIR /app
RUN npm install

WORKDIR /
ADD init-phanpy.sh /docker-entrypoint.d/00_init-phanpy.sh
ADD nginx-phanpy.conf /etc/nginx/conf.d/default.conf
