# **Cygnus Periphery Contract**

Allows users to interact with Cygnus Core contracts to:

-   Mint CygLP and CygDAI
-   Redeem CygLP and CygDAI
-   Borrow DAI
-   Repay DAI
-   Leverage LP Tokens
-   Deleverage LP Tokens

 <hr/>

**Leverage**

```
// @notice For leverage functionality only
// @notice This function gets called after calling `borrow` on Borrow contract and having `amountDai` of DAI
// @param lp_token_pair The address of the LP Token
// @param token0 The address of token0 from the LP Token
// @param token1 The address of token1 from the LP Token
// @param dai_amount DAI amount to convert to token0 and token1 of the LP Token
func convert_dai_to_lp_tokens{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    lp_token_pair: felt, token0: felt, token1: felt, dai_amount: Uint256
) -> (total_amount_token_a: Uint256, total_amount_token_b: Uint256) {
```

The `cygnus_borrow` contract will send `amount_dai` to the router. The router then converts 50% of DAI to the collateral's underlying (an LP Token) token0 and 50% to token1. It then mints the LP Token, sends it to the collateral contract and mints CygLP to the borrower.

We pass token0 and token1 as parameters as these are used by the previous function.

<hr/>

**Deleverage**

```
// @notice For deleverage functionality only
// @notice Converts an amount of LP Token to DAI. It is called after calling `burn` on a uniswapV2 pair, and 
//         receiving amounts of token0 and token1
// @param token0 The address of token0 from the LP Token pair
// @param token1 The address of token1 from the LP Token pair
// @param token0_amount The amount of token A to convert to DAI
// @param token1_amount The amount of token B to convert to DAI
func convert_lp_token_to_dai{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    token0: felt, token1: felt, token0_amount: Uint256, token1_amount: Uint256
) -> (dai_amount: Uint256) {
```

The `cygnus_collateral` contract will send an LP Token amount after calling `flash_redeem_altair`. The router then transfers the LP Token to the liquidity pool and calls the `burn` function on the DEX, burning the amount of LP Token and returning the assets from the LP Token (amountA of token0, amountB of token1). It then converts all of amountA and amountB this contract has to DAI, sending it back to the borrowable contract.

<hr />

**Liquidate**

```
// @notice Main function used in Cygnus to liquidate borrows
// @param borrowable The address of the CygnusBorrow contract
// @param amount_max The maximum amount to liquidate
// @param borrower The address of the borrower
// @param recipient The address of the recipient
// @param deadline The time by which the transaction must be included to effect the change
@external
func liquidate{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    borrowable: felt, amount_max: Uint256, borrower: felt, recipient: felt, deadline: felt
) -> (amount: Uint256, seize_tokens: Uint256) {

```

The `liquidate` function will send DAI back to the borrow contract and call the `seize_cyg_lp` function on the collateral contract, increasing the liquidator's collateral balance (LP Token) by the liquidated amount PLUS the `liquidation_incentive` (Default is 2.5%) and decrease the collateral balance (LP Token) of the user being liquidated. The router first transfers `amount_max` of DAI from the liquidator to the borrow contract (it checks if amountMax is more than borrower's total borrow balance, if so, then just returns borrow balance) and then will liquidate the `borrower` address.

The liquidator has CygLP in their wallet which can be redeemed at any time for the underlying LP Token.

<hr />
