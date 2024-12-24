FROM ghcr.io/puppeteer/puppeteer:23.11.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable \
    MONGO_URI=mongodb://localhost:27017/crime-reporter

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
CMD [ "node", "dist/src/index.js" ]
