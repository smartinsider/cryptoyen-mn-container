FROM ubuntu:xenial
MAINTAINER Smart Insider <smartyinsider@gmail.com>

RUN apt-get update --yes && apt-get install --yes \
        build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libevent-dev wget \
        software-properties-common && \
    add-apt-repository --yes ppa:bitcoin/bitcoin && \
        apt-get update

RUN apt-get install --yes libdb4.8-dev libdb4.8++-dev \
            libminiupnpc-dev libzmq3-dev && \
    apt-get clean && \
    rm -rf /var/lib/ap/lists/*


#ARGS
ARG COIN_NAME=cryptoyen
ARG TARDAEMON=https://cryptoyen.icu/wallet/ubuntu16-daemon.tar.gz
ARG TARDB=${COIN_NAME}-database.tar.gz

#EXTRA
ENV port=29850
ENV masternodeprivkey=xxxxxxxxxxxxxxxxxx
ENV ip==x.x.x.x


#DAEMON INSTALL
WORKDIR /usr/local/bin
RUN wget -O ubuntu16-daemon.tar.gz ${TARDAEMON} && tar -xzf ubuntu16-daemon.tar.gz && rm ubuntu16-daemon.tar.gz

#DB INSTALL
#WORKDIR /root/.${COIN_NAME}
#RUN wget -O ${TARDB} ${GIT}${TARDB} && tar -xzf ${TARDB} && rm ${TARDB}

WORKDIR /root

#TO DO ! Change to sh
ENTRYPOINT cryptoyend --port=$port --masternodeprivkey=$masternodeprivkey --rpcuser=rpc_user --rpcpassword=rpc_pwassword --masternodeaddr=$ip --printtoconsole --masternode=1 --txindex=1 --bantime=50 --maxconnections=256



 






