#!/bin/bash

KEY="blockxtestkey-1"
CHAINID="blockx_12345-12345"
MONIKER="blockxtestkey-1"
MNEMONIC="student snap side castle clog bleak inspire goddess arm mixture egg glory scare spread crime"

# remove existing daemon and client
rm -rf ~/.blockx*

make build

echo $MNEMONIC | ./build/blockxd keys add $KEY --recover

./build/blockxd config keyring-backend $KEYRING
./build/blockxd config chain-id $CHAINID

# Set moniker and chain-id for Ethermint (Moniker can be anything, chain-id must be an integer)
./build/blockxd init $MONIKER --chain-id $CHAINID
