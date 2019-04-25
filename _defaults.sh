#!/usr/bin/env bash

# simverse workspace can be located outside this repo checkout
export SIMVERSE_WORKSPACE=${SIMVERSE_WORKSPACE:-_workspace}

# simverse repos can be located outside this repo checkout
export SIMVERSE_REPOS=${SIMVERSE_REPOS:-_repos}

#############################################################################################################################
# simnet create-time defaults, effective during ./sv create (or other ./sv commands)

export SIMVERSE_DOCKER_IMAGE_PREFIX=${SIMVERSE_DOCKER_IMAGE_PREFIX:-simverse/}
export SIMVERSE_DOCKER_NETWORK_PREFIX=${SIMVERSE_DOCKER_NETWORK_PREFIX:-$SIMVERSE_DOCKER_IMAGE_PREFIX}
export SIMVERSE_DOCKER_CONTAINER_PREFIX=${SIMVERSE_DOCKER_CONTAINER_PREFIX}
export SIMVERSE_HOST_UID=${SIMVERSE_HOST_UID:-$(id -u)}
export SIMVERSE_HOST_GID=${SIMVERSE_HOST_GID:-$(id -g)}

export DEFAULT_SIMNET_NAME=${DEFAULT_SIMNET_NAME:-default}
export DEFAULT_RECIPE_NAME=${DEFAULT_RECIPE_NAME:-default}
export DEFAULT_STATE_NAME=${DEFAULT_STATE_NAME:-master}

export SIMVERSE_BTCD_REPO_URL=${SIMVERSE_BTCD_REPO_URL:-https://github.com/btcsuite/btcd.git}
export SIMVERSE_BTCWALLET_REPO_URL=${SIMVERSE_BTCWALLET_REPO_URL:-https://github.com/btcsuite/btcwallet.git}
export SIMVERSE_LND_REPO_URL=${SIMVERSE_LND_REPO_URL:-https://github.com/lightningnetwork/lnd.git}
export SIMVERSE_BITCOIND_REPO_URL=${SIMVERSE_BITCOIND_REPO_URL:-https://github.com/bitcoin/bitcoin.git}
export SIMVERSE_LIGHTNING_REPO_URL=${SIMVERSE_LIGHTNING_REPO_URL:-https://github.com/ElementsProject/lightning.git}

export SIMVERSE_GIT_CLONE_OPTS=${SIMVERSE_GIT_CLONE_OPTS:-"--depth=1 --recursive"}
export SIMVERSE_GIT_REFERENCE_PREFIX=${SIMVERSE_GIT_REFERENCE_PREFIX} # used in tests
export SIMVERSE_GIT_FETCH_OPTS=${SIMVERSE_GIT_FETCH_OPTS}
export SIMVERSE_GIT_PULL_OPTS=${SIMVERSE_GIT_PULL_OPTS}

export FIRST_DLV_PORT_ON_HOST=${FIRST_DLV_PORT_ON_HOST:-41000}
export FIRST_DLV_PORT=${FIRST_DLV_PORT:-41000}

export SIMVERSE_PRE_SIGNAL_PORT=${SIMVERSE_PRE_SIGNAL_PORT:-55123}
export SIMVERSE_PRE_SIGNAL_PORT_ON_HOST=${SIMVERSE_PRE_SIGNAL_PORT_ON_HOST:-$SIMVERSE_PRE_SIGNAL_PORT}

export FIRST_LND_SERVER_PORT_ON_HOST=${FIRST_LND_SERVER_PORT_ON_HOST:-10000}
export FIRST_LND_RPC_PORT_ON_HOST=${FIRST_LND_RPC_PORT_ON_HOST:-10300}
export FIRST_LND_REST_PORT_ON_HOST=${FIRST_LND_REST_PORT_ON_HOST:-10600}

export FIRST_BTCWALLET_RPC_PORT_ON_HOST=${FIRST_BTCWALLET_RPC_PORT_ON_HOST:-12000}
export FIRST_BTCD_SERVER_PORT_ON_HOST=${FIRST_BTCD_SERVER_PORT_ON_HOST:-12300}
export FIRST_BTCD_RPC_PORT_ON_HOST=${FIRST_BTCD_RPC_PORT_ON_HOST:-12600}
export FIRST_BITCOIND_SERVER_PORT_ON_HOST=${FIRST_BITCOIND_SERVER_PORT_ON_HOST:-13000}
export FIRST_BITCOIND_RPC_PORT_ON_HOST=${FIRST_BITCOIND_RPC_PORT_ON_HOST:-13300}

export LND_AUTO_NAME_PREFIX=${LND_AUTO_NAME_PREFIX:-lnd}
export BTCD_AUTO_NAME_PREFIX=${BTCD_AUTO_NAME_PREFIX:-btcd}
export BITCOIND_AUTO_NAME_PREFIX=${BITCOIND_AUTO_NAME_PREFIX:-bitcoind}

# ---------------------------------------------------------------------------------------------------------------------------
# you can tweak these on per-node basis in your recipes

# note: these are relative to docker build context
export DEFAULT_BTCD_REPO_PATH=${DEFAULT_BTCD_REPO_PATH:-repos/btcd}
export DEFAULT_BTCWALLET_REPO_PATH=${DEFAULT_BTCWALLET_REPO_PATH:-repos/btcwallet}
export DEFAULT_LND_REPO_PATH=${DEFAULT_LND_REPO_PATH:-repos/lnd}
export DEFAULT_BITCOIND_REPO_PATH=${DEFAULT_BITCOIND_REPO_PATH:-repos/bitcoin}
export DEFAULT_BTCD_CONF_PATH=${DEFAULT_BTCD_CONF_PATH:-docker/btcd/btcd.conf}
export DEFAULT_BTCWALLET_CONF_PATH=${DEFAULT_BTCWALLET_CONF_PATH:-docker/btcd/btcwallet.conf}
export DEFAULT_LND_CONF_PATH=${DEFAULT_LND_CONF_PATH:-docker/lnd/lnd.conf}
export DEFAULT_BITCOIND_CONF_PATH=${DEFAULT_BITCOIND_CONF_PATH:-docker/bitcoind/bitcoin.conf}

export SIMVERSE_HOST_BIND=${SIMVERSE_HOST_BIND:-127.0.0.1:} # note the trailing colon, see https://docs.docker.com/compose/compose-file/#ports
export SIMVERSE_EXTRA_SERVICE_CONFIG=${SIMVERSE_EXTRA_SERVICE_CONFIG}

export DEBUG=${DEBUG:-info}
export FAUCET_ADDR=${FAUCET_ADDR:-mp76nrashrCCYLy3a8cAc5HufEas11yHbh} # note this is a regtest address
export FAUCET_ADDR_PRIVATE_KEY=${FAUCET_ADDR_PRIVATE_KEY:-cP2SDKHK9PwQyBwRcnCTar4R5iv8HMPNZs6aCNRJ5o736cWcYGsZ} # note this is a regtest key
export RPC_USER=${RPC_USER:-devuser}
export RPC_PASS=${RPC_PASS:-devpass}
export BTCWALLET_USER=${BTCWALLET_USER} # optional, RPC_USER will be used if not given
export BTCWALLET_PASS=${BTCWALLET_PASS} # optional, RPC_PASS will be used if not given

export BITCOIN_P2P_BIND=${BITCOIN_P2P_BIND:-0.0.0.0}
export BITCOIN_P2P_PORT=${BITCOIN_P2P_PORT:-18444} # note: touching this is not flexible, some ports are hardcoded or left default
export BITCOIN_RPC_BIND=${BITCOIN_RPC_BIND:-0.0.0.0}
export BITCOIN_RPC_PORT=${BITCOIN_RPC_PORT:-18334} # note: touching this is not flexible, some ports are hardcoded or left default
export BTCWALLET_RPC_BIND=${BTCWALLET_RPC_BIND:-0.0.0.0}
export BTCWALLET_RPC_PORT=${BTCWALLET_RPC_PORT:-18443} # note: touching this is not flexible, some ports are hardcoded or left default

export LND_CHAIN=${LND_CHAIN:-bitcoin}
export LND_BACKEND=${LND_BACKEND}
export LND_P2P_BIND=${LND_P2P_BIND:-0.0.0.0}
export LND_P2P_PORT=${LND_P2P_PORT:-9735}
export LND_RPC_BIND=${LND_RPC_BIND:-0.0.0.0}
export LND_RPC_PORT=${LND_RPC_PORT:-10009}
export LND_REST_BIND=${LND_REST_BIND:-0.0.0.0}
export LND_REST_PORT=${LND_REST_PORT:-8080}
export LND_BITCOIN_RPC_HOST=${LND_BITCOIN_RPC_HOST}

export ZMQ_BIND=${ZMQ_BIND:-0.0.0.0}
export ZMQ_PUBRAWBLOCK_PORT=${ZMQ_PUBRAWBLOCK_PORT:-28332}
export ZMQ_PUBRAWTX_PORT=${ZMQ_PUBRAWTX_PORT:-28333}

export LND_EXTRA_PARAMS=${LND_EXTRA_PARAMS}
export BTCD_EXTRA_PARAMS=${BTCD_EXTRA_PARAMS}
export BTCWALLET_EXTRA_PARAMS=${BTCWALLET_EXTRA_PARAMS}
export BTCCTL_EXTRA_PARAMS=${BTCCTL_EXTRA_PARAMS}
export BITCOINCLI_EXTRA_PARAMS=${BITCOINCLI_EXTRA_PARAMS}
export BITCOIND_EXTRA_PARAMS=${BITCOIND_EXTRA_PARAMS}

# GO specific
export GCFLAGS=${GCFLAGS:-"all=-N -l"} # compile with no optimizations, for go-delve debugger