#!/usr/bin/env bash

#!/usr/bin/env bash

source lib/init.sh

cp "seed-bitcoin.conf" ".bitcoin/bitcoin.conf"

RPC_USER=${RPC_USER}
RPC_PASS=${RPC_PASS}
BITCOIN_P2P_BIND=${BITCOIN_P2P_BIND}
BITCOIN_P2P_PORT=${BITCOIN_P2P_PORT}
BITCOIN_RPC_BIND=${BITCOIN_RPC_BIND}
BITCOIN_RPC_PORT=${BITCOIN_RPC_PORT}
BITCOIND_EXTRA_PARAMS=${BITCOIND_EXTRA_PARAMS}
ZMQ_PUBRAWBLOCK_PORT=${ZMQ_PUBRAWBLOCK_PORT} # 28332
ZMQ_PUBRAWTX_PORT=${ZMQ_PUBRAWTX_PORT} # 28333
ZMQ_BIND=${ZMQ_BIND} # 0.0.0.0
ZMQ_PUBRAWBLOCK="tcp://$ZMQ_BIND:$ZMQ_PUBRAWBLOCK_PORT"
ZMQ_PUBRAWTX="tcp://$ZMQ_BIND:$ZMQ_PUBRAWTX_PORT"

PARAMS=""
PARAMS+=" -regtest"
PARAMS+=" -server=1"
PARAMS+=" -rest=1"
PARAMS+=" -txindex=1"
PARAMS+=" -port=${BITCOIN_P2P_PORT}"
PARAMS+=" -rpcbind=${BITCOIN_RPC_BIND}"
PARAMS+=" -rpcport=${BITCOIN_RPC_PORT}"
PARAMS+=" -rpcallowip=0.0.0.0/0"

if [[ -n "$RPC_USER" ]]; then
  PARAMS+=" -rpcuser=$RPC_USER"
  PARAMS+=" -rpcpassword=$RPC_PASS"
fi

PARAMS+=" -zmqpubrawblock=$ZMQ_PUBRAWBLOCK"
PARAMS+=" -zmqpubrawtx=$ZMQ_PUBRAWTX"
PARAMS+=" -printtoconsole"

# this instructs bitcoind to activate segwit with mainnet rules since block 0
# without this segwit would be activated by default and that would break consensus with btcd peers
# https://github.com/bitcoin/bitcoin/pull/11389
PARAMS+=" -vbparams=segwit:0:999999999999"

set -x
exec bitcoind ${PARAMS} ${BITCOIND_EXTRA_PARAMS} "$@"
