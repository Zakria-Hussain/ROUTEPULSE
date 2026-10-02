FROM node:22-bookworm-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --legacy-peer-deps
COPY . .
RUN npm run build
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["sh","-c","npm start -- -p ${PORT:-3000}"]
