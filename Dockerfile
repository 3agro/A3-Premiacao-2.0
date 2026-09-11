FROM node:22-alpine
WORKDIR /app

# Copia explicitamente os arquivos do backend e do frontend.
# Se a pasta public não estiver no GitHub, o build falha em vez de publicar uma tela "Not found".
COPY package.json ./package.json
COPY server.mjs ./server.mjs
COPY public ./public

RUN test -f /app/public/index.html \
 && test -f /app/public/app.js \
 && test -f /app/public/styles.css \
 && mkdir -p /app/data

ENV PORT=8080 NODE_ENV=production
EXPOSE 8080
CMD ["node","server.mjs"]
