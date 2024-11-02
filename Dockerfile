FROM ghcr.io/puppeteer/puppeteer:23.6.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install  # This generates package-lock.json
RUN npm ci
COPY . .
CMD [ "node", "index.js" ]

