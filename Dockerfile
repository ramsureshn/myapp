FROM node:alpine as Initiater
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=Initiater /app/build /user/share/nginx/html
