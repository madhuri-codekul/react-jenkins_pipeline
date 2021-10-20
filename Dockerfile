FROM node:12.22.7

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install -g npm

#
#RUN npm install pm2 -g

# add app
COPY . ./

# start app
CMD ["npm", "start"]
#CMD ["pm2-runtime", "app.js"]