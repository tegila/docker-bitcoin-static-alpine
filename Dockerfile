FROM ubuntu:18.04

EXPOSE 8332 8333

# Compile Bitcoin, uninstall dev packages after compilation
ARG VERSION=v0.17.0.1
ARG MAKE_JOBS=1
ARG TEMP_PACKAGES="build-essential libtool autotools-dev automake pkg-config python3 git wget ca-certificates libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-thread-dev libboost-program-options-dev"
RUN apt-get update && \
apt-get install -y --no-install-recommends libssl1.1 libevent-2.1-6 libevent-core-2.1-6 libevent-pthreads-2.1-6 libboost-system1.65.1 libboost-filesystem1.65.1 libboost-chrono1.65.1 libboost-thread1.65.1 libboost-program-options1.65.1 $TEMP_PACKAGES && \
cd /usr/src/ && git clone https://github.com/bitcoin/bitcoin.git && \
cd bitcoin && git checkout $VERSION && \
./contrib/install_db4.sh `pwd` && \
./autogen.sh && \
export BDB_PREFIX='/usr/src/bitcoin/db4' && \
./configure --disable-tests --disable-bench --without-gui --without-miniupnpc BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" && \
make -j$MAKE_JOBS && \
make install && \
cd && rm -R /usr/src/bitcoin && \
apt-get purge --auto-remove -y $TEMP_PACKAGES && \
rm -rf /var/lib/apt/lists/*

# Add bitcoin user
WORKDIR /bitcoin
RUN groupadd -g 999 bitcoin && \
useradd -u 999 -g bitcoin -s /bin/bash -m bitcoin && \
chown bitcoin:bitcoin /bitcoin
USER bitcoin

CMD ["bitcoind", "-datadir=/bitcoin", "-printtoconsole"]
