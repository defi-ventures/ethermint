***System Requirements***

OS - ubuntu 18.04

Memory - 4 GB RAM

CPU - 2vCPU

***Public RPC details***

URL - https://testnet-2.blockxnet.com

Chain ID - 12345

***Chain ID (testnet v2)***

blockx_12345-12345

***Steps to setup a validator for testnet v2***

1. Clone the repository

```bash
cd ~/
git clone https://github.com/defi-ventures/ethermint.git
```

2. Install the following for setup

```bash
apt-get update
apt-get install make build-essential jq
snap install go --classic
```

3. Change the value of KEY, CHAINID, MONIKER, MNEMONIC in setup_validator.sh before running the validator node setup.
```bash
cd ~/ethermint
bash setup_validator.sh
```

4. Replace the genesis file in ~/.blockxd/config/
```
{
   "genesis_time":"2022-03-21T18:42:23.852588903Z",
   "chain_id":"blockx_12345-12345",
   "initial_height":"1",
   "consensus_params":{
      "block":{
         "max_bytes":"22020096",
         "max_gas":"-1",
         "time_iota_ms":"1000"
      },
      "evidence":{
         "max_age_num_blocks":"100000",
         "max_age_duration":"172800000000000",
         "max_bytes":"1048576"
      },
      "validator":{
         "pub_key_types":[
            "ed25519"
         ]
      },
      "version":{

      }
   },
   "app_hash":"",
   "app_state":{
      "auth":{
         "params":{
            "max_memo_characters":"256",
            "tx_sig_limit":"7",
            "tx_size_cost_per_byte":"10",
            "sig_verify_cost_ed25519":"590",
            "sig_verify_cost_secp256k1":"1000"
         },
         "accounts":[
            {
               "@type":"/ethermint.types.v1.EthAccount",
               "base_account":{
                  "address":"ethm12fkhumzzmdjlph5dcj5hemzqlc663pf5h8ksrk",
                  "pub_key":null,
                  "account_number":"0",
                  "sequence":"0"
               },
               "code_hash":"0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"
            }
         ]
      },
      "authz":{
         "authorization":[

         ]
      },
      "bank":{
         "params":{
            "send_enabled":[

            ],
            "default_send_enabled":true
         },
         "balances":[
            {
               "address":"ethm12fkhumzzmdjlph5dcj5hemzqlc663pf5h8ksrk",
               "coins":[
                  {
                     "denom":"abcx",
                     "amount":"1000000000000000000000000000"
                  }
               ]
            }
         ],
         "supply":[
            {
               "denom":"abcx",
               "amount":"1000000000000000000000000000"
            }
         ],
         "denom_metadata":[

         ]
      },
      "capability":{
         "index":"1",
         "owners":[

         ]
      },
      "crisis":{
         "constant_fee":{
            "denom":"abcx",
            "amount":"1000"
         }
      },
      "distribution":{
         "params":{
            "community_tax":"0.020000000000000000",
            "base_proposer_reward":"0.010000000000000000",
            "bonus_proposer_reward":"0.040000000000000000",
            "withdraw_addr_enabled":true
         },
         "fee_pool":{
            "community_pool":[

            ]
         },
         "delegator_withdraw_infos":[

         ],
         "previous_proposer":"",
         "outstanding_rewards":[

         ],
         "validator_accumulated_commissions":[

         ],
         "validator_historical_rewards":[

         ],
         "validator_current_rewards":[

         ],
         "delegator_starting_infos":[

         ],
         "validator_slash_events":[

         ]
      },
      "evidence":{
         "evidence":[

         ]
      },
      "evm":{
         "accounts":[

         ],
         "params":{
            "evm_denom":"abcx",
            "enable_create":true,
            "enable_call":true,
            "extra_eips":[

            ],
            "chain_config":{
               "homestead_block":"0",
               "dao_fork_block":"0",
               "dao_fork_support":true,
               "eip150_block":"0",
               "eip150_hash":"0x0000000000000000000000000000000000000000000000000000000000000000",
               "eip155_block":"0",
               "eip158_block":"0",
               "byzantium_block":"0",
               "constantinople_block":"0",
               "petersburg_block":"0",
               "istanbul_block":"0",
               "muir_glacier_block":"0",
               "berlin_block":"0",
               "london_block":"0",
               "arrow_glacier_block":"0",
               "merge_fork_block":"0"
            }
         }
      },
      "feegrant":{
         "allowances":[

         ]
      },
      "feemarket":{
         "params":{
            "no_base_fee":false,
            "base_fee_change_denominator":8,
            "elasticity_multiplier":2,
            "initial_base_fee":"1000000000",
            "enable_height":"0"
         },
         "base_fee":"1000000000",
         "block_gas":"0"
      },
      "genutil":{
         "gen_txs":[
            {
               "body":{
                  "messages":[
                     {
                        "@type":"/cosmos.staking.v1beta1.MsgCreateValidator",
                        "description":{
                           "moniker":"validator-1",
                           "identity":"",
                           "website":"",
                           "security_contact":"",
                           "details":""
                        },
                        "commission":{
                           "rate":"0.100000000000000000",
                           "max_rate":"0.200000000000000000",
                           "max_change_rate":"0.010000000000000000"
                        },
                        "min_self_delegation":"1",
                        "delegator_address":"ethm12fkhumzzmdjlph5dcj5hemzqlc663pf5h8ksrk",
                        "validator_address":"ethmvaloper12fkhumzzmdjlph5dcj5hemzqlc663pf5chuumt",
                        "pubkey":{
                           "@type":"/cosmos.crypto.ed25519.PubKey",
                           "key":"Th8q3YUYkdyup1X+2iIGTysDXuoE0t9LpHRjUBrvqLs="
                        },
                        "value":{
                           "denom":"abcx",
                           "amount":"10000000000000000000000"
                        }
                     }
                  ],
                  "memo":"c76f0ff3f82665e995a2706ccf8bfe83dfbf88e0@10.12.20.240:26656",
                  "timeout_height":"0",
                  "extension_options":[

                  ],
                  "non_critical_extension_options":[

                  ]
               },
               "auth_info":{
                  "signer_infos":[
                     {
                        "public_key":{
                           "@type":"/ethermint.crypto.v1.ethsecp256k1.PubKey",
                           "key":"A5ZbQPTCM4L6oSiHsIbUQf0dUguqR4r07DOtXxbtTvUn"
                        },
                        "mode_info":{
                           "single":{
                              "mode":"SIGN_MODE_DIRECT"
                           }
                        },
                        "sequence":"0"
                     }
                  ],
                  "fee":{
                     "amount":[

                     ],
                     "gas_limit":"200000",
                     "payer":"",
                     "granter":""
                  }
               },
               "signatures":[
                  "gXxx3FUf8R0L7mngw+D1XmHkL4y+WnEiIeo8n5Hfu7ggjWyJnuz1gRwAaTArKCpMIv4iWW+IrcpMtgrMtdU47QE="
               ]
            }
         ]
      },
      "gov":{
         "starting_proposal_id":"1",
         "deposits":[

         ],
         "votes":[

         ],
         "proposals":[

         ],
         "deposit_params":{
            "min_deposit":[
               {
                  "denom":"abcx",
                  "amount":"10000000"
               }
            ],
            "max_deposit_period":"172800s"
         },
         "voting_params":{
            "voting_period":"172800s"
         },
         "tally_params":{
            "quorum":"0.334000000000000000",
            "threshold":"0.500000000000000000",
            "veto_threshold":"0.334000000000000000"
         }
      },
      "ibc":{
         "client_genesis":{
            "clients":[

            ],
            "clients_consensus":[

            ],
            "clients_metadata":[

            ],
            "params":{
               "allowed_clients":[
                  "06-solomachine",
                  "07-tendermint"
               ]
            },
            "create_localhost":false,
            "next_client_sequence":"0"
         },
         "connection_genesis":{
            "connections":[

            ],
            "client_connection_paths":[

            ],
            "next_connection_sequence":"0",
            "params":{
               "max_expected_time_per_block":"30000000000"
            }
         },
         "channel_genesis":{
            "channels":[

            ],
            "acknowledgements":[

            ],
            "commitments":[

            ],
            "receipts":[

            ],
            "send_sequences":[

            ],
            "recv_sequences":[

            ],
            "ack_sequences":[

            ],
            "next_channel_sequence":"0"
         }
      },
      "mint":{
         "minter":{
            "inflation":"0.130000000000000000",
            "annual_provisions":"0.000000000000000000"
         },
         "params":{
            "mint_denom":"abcx",
            "inflation_rate_change":"0.130000000000000000",
            "inflation_max":"0.200000000000000000",
            "inflation_min":"0.070000000000000000",
            "goal_bonded":"0.670000000000000000",
            "blocks_per_year":"6311520"
         }
      },
      "params":null,
      "slashing":{
         "params":{
            "signed_blocks_window":"100",
            "min_signed_per_window":"0.500000000000000000",
            "downtime_jail_duration":"600s",
            "slash_fraction_double_sign":"0.050000000000000000",
            "slash_fraction_downtime":"0.010000000000000000"
         },
         "signing_infos":[

         ],
         "missed_blocks":[

         ]
      },
      "staking":{
         "params":{
            "unbonding_time":"1814400s",
            "max_validators":100,
            "max_entries":7,
            "historical_entries":10000,
            "bond_denom":"abcx"
         },
         "last_total_power":"0",
         "last_validator_powers":[

         ],
         "validators":[

         ],
         "delegations":[

         ],
         "unbonding_delegations":[

         ],
         "redelegations":[

         ],
         "exported":false
      },
      "transfer":{
         "port_id":"transfer",
         "denom_traces":[

         ],
         "params":{
            "send_enabled":true,
            "receive_enabled":true
         }
      },
      "upgrade":{

      },
      "vesting":{

      }
   }
}
```

5. Add the following in seeds, persistent_peers in ~/.blockxd/config/config.toml
```
c76f0ff3f82665e995a2706ccf8bfe83dfbf88e0@35.170.78.143:26656,8bf553280fdb5b9f67661339de4c8fc24d1e429e@44.199.206.198:26656
```

6. Reset the local chain config
```bash
cd ~/ethermint
./build/blockxd unsafe-reset-all
```

7. Start local node and check if its syncing
```bash
./build/blockxd start --pruning=nothing --evm.tracer=json "--trace" --log_level "info"
```

8. Acquire test tokens from the team for the address generated from the mnemonic

9. Run create validator command to become a validator in the network after the blockchain syncs completely(change values in commands accordingly).
Amount should be of the format - <x>abcx
```bash
./build/blockxd tx staking create-validator --amount=<> --pubkey=$(./build/blockxd tendermint show-validator) --moniker=<> --chain-id=blockx_12345-12345 --commission-rate="0.10" --commission-max-rate="0.20" --commission-max-change-rate="0.01" --min-self-delegation="1" --gas="auto" --from=<>
```
