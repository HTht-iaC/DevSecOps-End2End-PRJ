FROM node:18-alpine 
WORKDIR /app 
COPY package*.json .
RUN npm install 
COPY . .
RUN addgroup myapp && adduser -S -G myapp myapp
USER myapp
CMD ["node", "index.js"] 


