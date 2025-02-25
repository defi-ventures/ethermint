package feemarket

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	abci "github.com/tendermint/tendermint/abci/types"

	"github.com/defi-ventures/ethermint/x/feemarket/keeper"
	"github.com/defi-ventures/ethermint/x/feemarket/types"
)

// InitGenesis initializes genesis state based on exported genesis
func InitGenesis(
	ctx sdk.Context,
	k keeper.Keeper,
	data types.GenesisState,
) []abci.ValidatorUpdate {
	k.SetParams(ctx, data.Params)
	k.SetBaseFee(ctx, data.BaseFee.BigInt())
	k.SetBlockGasUsed(ctx, data.BlockGas)

	return []abci.ValidatorUpdate{}
}

// ExportGenesis exports genesis state of the fee market module
func ExportGenesis(ctx sdk.Context, k keeper.Keeper) *types.GenesisState {
	baseFee := sdk.ZeroInt()
	baseFeeInt := k.GetBaseFee(ctx)
	if baseFeeInt != nil {
		baseFee = sdk.NewIntFromBigInt(baseFeeInt)
	}

	return &types.GenesisState{
		Params:   k.GetParams(ctx),
		BaseFee:  baseFee,
		BlockGas: k.GetBlockGasUsed(ctx),
	}
}
