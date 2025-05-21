ARG NODE_VERSION=22.0.0

FROM node:${NODE_VERSION}-alpine AS builder

WORKDIR /usr/src/app

USER node

COPY --chown=node:node package.json package-lock.json* ./

RUN npm install --production

COPY . .

RUN --chown=node:node npm run build:ssr


FROM node:${NODE_VERSION}-alpine AS final

WORKDIR /usr/src/app

ENV NODE_ENV=production

USER node

COPY --from=builder /usr/src/app/.output .output
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/package.json ./package.json

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]

