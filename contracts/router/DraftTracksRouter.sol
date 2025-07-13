// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../SwapRouter.sol";

/// @title DraftTracksRouter
/// @author DraftTracks
/// @notice Custom swap router that emits events for $TRACK-related swaps
contract DraftTracksRouter is SwapRouter {
    /// @notice Immutable address of the $TRACK token
    address public immutable TRACK;

    /// @notice Emitted when a $TRACK-related swap is executed
    event TrackSwapExecuted(
        address indexed sender,
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOut
    );

    /// @param _factory The Uniswap V3 factory address
    /// @param _WETH9 The WETH9 (or WMATIC) address
    /// @param _trackToken The $TRACK token address
    constructor(
        address _factory,
        address _WETH9,
        address _trackToken
    ) SwapRouter(_factory, _WETH9) {
        require(_trackToken != address(0), "Invalid TRACK");
        TRACK = _trackToken;
    }

    /// @inheritdoc ISwapRouter
    function exactInput(ExactInputParams calldata params)
        public
        payable
        override
        returns (uint256 amountOut)
    {
        // Convert calldata to memory (required for super)
        ExactInputParams memory mParams = ExactInputParams({
            path: params.path,
            recipient: params.recipient,
            amountIn: params.amountIn,
            amountOutMinimum: params.amountOutMinimum,
            deadline: params.deadline
        });

        amountOut = super.exactInput(mParams);

        (address tokenIn, address tokenOut) = decodeFirstPool(params.path);
        if (tokenIn == TRACK || tokenOut == TRACK) {
            emit TrackSwapExecuted(msg.sender, tokenIn, tokenOut, params.amountIn, amountOut);
        }
    }

    /// @inheritdoc ISwapRouter
    function exactInputSingle(ExactInputSingleParams calldata params)
        public
        payable
        override
        returns (uint256 amountOut)
    {
        // Convert calldata to memory
        ExactInputSingleParams memory mParams = ExactInputSingleParams({
            tokenIn: params.tokenIn,
            tokenOut: params.tokenOut,
            fee: params.fee,
            recipient: params.recipient,
            deadline: params.deadline,
            amountIn: params.amountIn,
            amountOutMinimum: params.amountOutMinimum,
            sqrtPriceLimitX96: params.sqrtPriceLimitX96
        });

        amountOut = super.exactInputSingle(mParams);

        if (params.tokenIn == TRACK || params.tokenOut == TRACK) {
            emit TrackSwapExecuted(
                msg.sender,
                params.tokenIn,
                params.tokenOut,
                params.amountIn,
                amountOut
            );
        }
    }

    /// @notice Decodes the first pool (tokenIn, tokenOut) from a Uniswap V3 path
    function decodeFirstPool(bytes memory path)
        internal
        pure
        returns (address tokenA, address tokenB)
    {
        require(path.length >= 43, "Invalid path");

        assembly {
            tokenA := shr(96, mload(add(path, 20)))
            tokenB := shr(96, mload(add(path, 43)))
        }
    }
}
