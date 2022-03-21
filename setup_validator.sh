#!/bin/bash

KEY="blockxtestkey-1"
CHAINID="blockx_12345-12345"
MONIKER=""
MNEMONIC=""

# remove existing daemon and client
rm -rf ~/.blockx*

make build

./build/blockxd config keyring-backend $KEYRING
./build/blockxd config chain-id $CHAINID

# Set moniker and chain-id for Ethermint (Moniker can be anything, chain-id must be an integer)
./build/blockxd init $MONIKER --chain-id $CHAINID

# if $KEY exists it should be deleted
echo $MNEMONIC | ./build/blockxcli keys add $KEY --recover

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
./build/blockxd start --pruning=nothing --evm.tracer=json $TRACE --log_level $LOGLEVEL --minimum-gas-prices=0.0001abcx --json-rpc.api eth,txpool,net,web3 --api.enable
