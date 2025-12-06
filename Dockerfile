FROM nginx:mainline-alpine

RUN apk add --no-cache \
    git \
    npm \
    ca-certificates

# init phanpy
RUN git clone -b main https://github.com/cheeaun/phanpy.git /app
WORKDIR /app
#RUN wget -O gts-local.patch https://patch-diff.githubusercontent.com/raw/cheeaun/phanpy/pull/1047.patch && git apply --3way --union --ignore-space-change --ignore-whitespace gts-local.patch && rm gts-local.patch
RUN npm install

WORKDIR /
ADD init-phanpy.sh /docker-entrypoint.d/00-init-phanpy.sh
ADD nginx-phanpy.conf /etc/nginx/conf.d/default.conf
