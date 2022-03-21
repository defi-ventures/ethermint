#!/bin/bash

KEY="blockxtestkey-1"
CHAINID="blockx_12345-12345"
MONIKER=""
KEYRING=""
KEYALGO="eth_secp256k1"
LOGLEVEL="info"
# to trace evm
TRACE="--trace"
# TRACE=""
GENESIS_ACCOUNT_AMOUNT=100000000000000000000000000abcx
STAKE_AMOUNT=10000000000000000000000abcx
MNEMONIC=""

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# remove existing daemon and client
rm -rf ~/.blockxd*

make build

./build/blockxd config keyring-backend $KEYRING
./build/blockxd config chain-id $CHAINID

# Set moniker and chain-id for Ethermint (Moniker can be anything, chain-id must be an integer)
./build/blockxd init $MONIKER --chain-id $CHAINID

# if $KEY exists it should be deleted
echo $MNEMONIC | ./build/blockxd keys add $KEY --recover

# Change parameter token denominations to abcx
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json
cat $HOME/.blockxd/config/genesis.json | jq '.app_state["mint"]["params"]["mint_denom"]="abcx"' > $HOME/.blockxd/config/tmp_genesis.json && mv $HOME/.blockxd/config/tmp_genesis.json $HOME/.blockxd/config/genesis.json

# Allocate genesis accounts (cosmos formatted addresses)
./build/blockxd add-genesis-account $KEY $GENESIS_ACCOUNT_AMOUNT --keyring-backend $KEYRING

# Sign genesis transaction
./build/blockxd gentx $KEY $STAKE_AMOUNT --keyring-backend $KEYRING --chain-id $CHAINID

# Collect genesis tx
./build/blockxd collect-gentxs

# Run this to ensure everything worked and that the genesis file is setup correctly
./build/blockxd validate-genesis

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
./build/blockxd start --pruning=nothing --evm.tracer=json $TRACE --log_level $LOGLEVEL --minimum-gas-prices=0.0001abcx --json-rpc.api eth,txpool,net,web3 --api.enable
