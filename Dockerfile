FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80

COPY --from=Initiater /app/build /user/share/nginx/html
