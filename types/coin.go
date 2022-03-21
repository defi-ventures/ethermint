package types

import (
	"math/big"

	sdk "github.com/cosmos/cosmos-sdk/types"
)

const (
	// AttoBcx defines the default coin denomination used in Ethermint in:
	//
	// - Staking parameters: denomination used as stake in the dPoS chain
	// - Mint parameters: denomination minted due to fee distribution rewards
	// - Governance parameters: denomination used for spam prevention in proposal deposits
	// - Crisis parameters: constant fee denomination used for spam prevention to check broken invariant
	// - EVM parameters: denomination used for running EVM state transitions in Ethermint.
	AttoBcx string = "abcx"

	// BaseDenomUnit defines the base denomination unit for Bcxs.
	// 1 bcx = 1x10^{BaseDenomUnit} abcx
	BaseDenomUnit = 18

	// DefaultGasPrice is default gas price for evm transactions
	DefaultGasPrice = 20
)

// PowerReduction defines the default power reduction value for staking
var PowerReduction = sdk.NewIntFromBigInt(new(big.Int).Exp(big.NewInt(10), big.NewInt(BaseDenomUnit), nil))

// NewBcxCoin is a utility function that returns an "abcx" coin with the given sdk.Int amount.
// The function will panic if the provided amount is negative.
func NewBcxCoin(amount sdk.Int) sdk.Coin {
	return sdk.NewCoin(AttoBcx, amount)
}

// NewBcxDecCoin is a utility function that returns an "abcx" decimal coin with the given sdk.Int amount.
// The function will panic if the provided amount is negative.
func NewBcxDecCoin(amount sdk.Int) sdk.DecCoin {
	return sdk.NewDecCoin(AttoBcx, amount)
}

// NewBcxCoinInt64 is a utility function that returns an "abcx" coin with the given int64 amount.
// The function will panic if the provided amount is negative.
func NewBcxCoinInt64(amount int64) sdk.Coin {
	return sdk.NewInt64Coin(AttoBcx, amount)
}
