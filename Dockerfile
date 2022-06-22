FROM ubuntu:22.04

EXPOSE 3000
WORKDIR /root

RUN apt update && apt install sudo curl git -y
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN git clone https://github.com/cybersecsi/HOUDINI.git
RUN cd HOUDINI && yarn install && cd ./webapp && yarn install
RUN cd HOUDINI && yarn run build

ENTRYPOINT cd HOUDINI && yarn start
