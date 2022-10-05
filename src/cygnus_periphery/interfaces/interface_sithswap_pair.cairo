// SPDX-License-Identifier: BUSL-1.1
%lang starknet

from starkware.cairo.common.uint256 import Uint256

// ▁▂▃▄▅▆▇█▉▊▋▌▍▎▏ STRUCTURES  ▏▎▍▌▋▊▉█▇▆▅▄▃▂▁

struct Observation {
    timestamp: felt,
    reserve0_cumulative: Uint256,
    reserve1_cumulative: Uint256,
}

@contract_interface
namespace ISithSwapV1Pair {
    // ▁▂▃▄▅▆▇█▉▊▋▌▍▎▏ INIT  ▏▎▍▌▋▊▉█▇▆▅▄▃▂▁

    func initialize(pid: felt, token0: felt, token1: felt, stable: felt, fee: felt, fees: felt) {
    }

    // ▁▂▃▄▅▆▇█▉▊▋▌▍▎▏ VIEWS  ▏▎▍▌▋▊▉█▇▆▅▄▃▂▁

    func getPid() -> (res: felt) {
    }

    func getToken0() -> (res: felt) {
    }

    func getToken1() -> (res: felt) {
    }

    func getStable() -> (res: felt) {
    }

    func getFees() -> (res: felt) {
    }

    func getFee() -> (res: felt) {
    }

    func getLastFeeUpdate() -> (res: felt) {
    }

    func getReserve0() -> (res: Uint256) {
    }

    func getReserve1() -> (res: Uint256) {
    }

    func getBlockTimestampLast() -> (res: felt) {
    }

    func getReserve0CumulativeLast() -> (res: Uint256) {
    }

    func getReserve1CumulativeLast() -> (res: Uint256) {
    }

    func getIndex0() -> (res: Uint256) {
    }

    func getIndex1() -> (res: Uint256) {
    }

    func getSupplyIndex0(account: felt) -> (res: Uint256) {
    }

    func getSupplyIndex1(account: felt) -> (res: Uint256) {
    }

    func getClaimable0(account: felt) -> (res: Uint256) {
    }

    func getClaimable1(account: felt) -> (res: Uint256) {
    }

    func getMetadata() -> (
        pid: felt, stable: felt, token0: felt, token1: felt, decimals0: felt, decimals1: felt
    ) {
    }

    func getTokens() -> (token0: felt, token1: felt) {
    }

    func getReserves() -> (reserve0: Uint256, reserve1: Uint256, timestamp: felt) {
    }

    func getAmountOut(amount_in: Uint256, token_in: felt) -> (amount_out: Uint256) {
    }

    func getTradeFee(amount_in: Uint256) -> (amount_fee: Uint256) {
    }

    func getTradeDiff(amount_in: Uint256, token_in: felt) -> (rate_a: Uint256, rate_b: Uint256) {
    }

    func getObservationsLength() -> (res: felt) {
    }

    func lastObservation() -> (res: Observation) {
    }

    func currentCumulativePrices() -> (
        reserve0_cumulative: Uint256, reserve11_cumulative: Uint256, block_timestamp: felt
    ) {
    }

    func current(token_in: felt, amount_in: Uint256) -> (amount_out: Uint256) {
    }

    func sample(token_in: felt, amount_in: Uint256, points: felt, window: felt) -> (
        prices_len: felt, prices: Uint256*
    ) {
    }

    func quote(token_in: felt, amount_in: Uint256, granularity: felt) -> (amount_out: Uint256) {
    }

    func prices(token_in: felt, amount_in: Uint256, points: felt) -> (
        prices_len: felt, prices: Uint256*
    ) {
    }

    func name() -> (res: felt) {
    }

    func symbol() -> (res: felt) {
    }

    func decimals() -> (res: felt) {
    }

    func totalSupply() -> (res: Uint256) {
    }

    func balanceOf(account: felt) -> (res: Uint256) {
    }

    func allowance(owner: felt, spender) -> (remaining: Uint256) {
    }

    func owner() -> (res: felt) {
    }

    func pendingOwner() -> (res: felt) {
    }

    // ▁▂▃▄▅▆▇█▉▊▋▌▍▎▏EXTERNALS ▏▎▍▌▋▊▉█▇▆▅▄▃▂▁

    func setTradeFee(fee: felt) {
    }

    func claimFees() -> (claimed0: Uint256, claimed1: Uint256) {
    }

    func mint(to: felt) -> (liquidity: Uint256) {
    }

    func burn(to: felt) -> (amount0: Uint256, amount1: Uint256) {
    }

    func swap(amount0_out: Uint256, amount1_out: Uint256, to: felt, data: felt) {
    }

    func skim(to: felt) {
    }

    func sync() {
    }

    func transfer(dst: felt, amount: Uint256) -> (res: felt) {
    }

    func transferFrom(src: felt, dst: felt, amount: Uint256) -> (res: felt) {
    }

    func approve(spender: felt, amount: Uint256) {
    }

    func increaseAllowance(spender: felt, added_value: Uint256) -> (success: felt) {
    }

    func decreaseAllowance(spender: felt, subtracted_value: Uint256) -> (success: felt) {
    }

    func transferOwnership(new_owner: felt, direct: felt) {
    }

    func claimOwnership() {
    }

    func renounceOwnership() {
    }

    func reviveOwner(new_owner: felt) {
    }
}
