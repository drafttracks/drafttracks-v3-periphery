// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.20;

import "@uniswap/v3-periphery/contracts/SwapRouter.sol";

/// @title DraftTracksRouter
/// @notice Custom Swap Router for the DraftTracks protocol.
/// Emits $TRACK-focused events and integrates artist token logic.
contract DraftTracksRouter is SwapRouter {
    address public immutable TRACK;

    /// @notice Emitted when a $TRACK-involved swap occurs
    event TrackSwapExecuted(
        address indexed sender,
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOut
    );

    constructor(
        address _factory,
        address _WETH9,
        address _trackToken
    ) SwapRouter(_factory, _WETH9) {
        require(_trackToken != address(0), "Invalid $TRACK address");
        TRACK = _trackToken;
    }

    /// @notice Swap exact input tokens for output tokens and log $TRACK swaps
    function exactInput(SwapRouter.ExactInputParams calldata params)
        public
        payable
        override
        returns (uint256 amountOut)
    {
        amountOut = super.exactInput(params);

        (address tokenIn, address tokenOut) = decodeFirstPool(params.path);
        if (tokenIn == TRACK || tokenOut == TRACK) {
            emit TrackSwapExecuted(msg.sender, tokenIn, tokenOut, params.amountIn, amountOut);
        }
    }

    /// @notice Decode the first pool tokens from the path (same as Uniswap V3 path format)
    function decodeFirstPool(bytes memory path) internal pure returns (address tokenA, address tokenB) {
        require(path.length >= 20 + 20 + 3, "Invalid path");

        assembly {
            tokenA := shr(96, mload(add(path, 32)))
            tokenB := shr(96, mload(add(path, 52)))
        }
    }
}
