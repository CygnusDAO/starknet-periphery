%lang starknet

from starkware.cairo.common.uint256 import Uint256

from src.cygnus_core.interfaces.interface_cygnus_altair_call import BorrowCallData

from src.cygnus_core.interfaces.interface_cygnus_altair_call import RedeemCallData

@contract_interface
namespace ICygnusAltairX {
    func giza_power_plant() -> (giza_power_plant: felt) {
    }

    func native_token() -> (native_token: felt) {
    }

    func dai() -> (dai: felt) {
    }

    func dex_aggregator() -> (dex_aggregator: felt) {
    }

    func get_current_solver() -> (solver: felt) {
    }

    func borrow(borrowable: felt, borrow_amount: Uint256, recipient: felt, deadline: felt) {
    }

    func repay(borrowable: felt, amount_max: Uint256, borrower: felt, deadline: felt) -> (
        amount: Uint256
    ) {
    }

    func liquidate(
        borrowable: felt, amount_max: Uint256, borrower: felt, recipient: felt, deadline: felt
    ) -> (amount: Uint256, seize_tokens: Uint256) {
    }

    func leverage(
        collateral: felt,
        borrowable: felt,
        dai_amount_desired: Uint256,
        recipient: felt,
        deadline: felt,
    ) {
    }

    func altair_borrow(sender: felt, borrow_amount: Uint256, borrow_data: BorrowCallData) {
    }

    func deleverage(collateral: felt, borrowable: felt, redeem_tokens: Uint256, deadline: felt) {
    }

    func altair_redeem(sender: felt, redeem_amount: Uint256, redeem_data: RedeemCallData) {
    }
}
