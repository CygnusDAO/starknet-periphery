%lang starknet

from starkware.cairo.common.uint256 import Uint256

@contract_interface
namespace IHub {
    func swap_with_solver(
        _token_in: felt,
        _token_out: felt,
        _amount_in: Uint256,
        _min_amount_out: Uint256,
        _to: felt,
        _solver_id: felt,
    ) -> (received_amount: Uint256) {
    }
}
