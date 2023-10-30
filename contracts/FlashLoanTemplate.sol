// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import "@balancer-labs/v2-interfaces/contracts/vault/IVault.sol";
import "@balancer-labs/v2-interfaces/contracts/vault/IFlashLoanRecipient.sol";

contract FlashLoanTemplate is IFlashLoanRecipient {
    IVault public constant vault =
        IVault(0xBA12222222228d8Ba445958a75a0704d566BF2C8);
    //address public constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant WETH = 0xdFCeA9088c8A88A76FF74892C1457C17dfeef9C1; //goerli network

    // address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant DAI = 0x2899a03ffDab5C90BADc5920b4f53B0884EB13cC; //goerli network

    event FlashLoan(address token, uint256 amount);

    constructor() payable {}

    function getFlashloan(address flashToken, uint256 flashAmount) external {
        uint256 balanceBefore = IERC20(flashToken).balanceOf(address(this));
        bytes memory data = abi.encode(flashToken, flashAmount, balanceBefore);

        // Token to flash loan, by default we are flash loaning 1 token.
        IERC20[] memory tokens = new IERC20[](1);
        tokens[0] = IERC20(flashToken);

        // Flash loan amount.
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = flashAmount;

        vault.flashLoan(this, tokens, amounts, data); // execution goes to `receiveFlashLoan`
    }

    function receiveFlashLoan(
        IERC20[] memory tokens,
        uint256[] memory amounts,
        uint256[] memory feeAmounts,
        bytes memory userData
    ) external {
        require(
            msg.sender == address(vault),
            "FlashLoanTemplate: Caller not Balancer Vault"
        );

        (address flashToken, uint256 flashAmount, uint256 balanceBefore) = abi
            .decode(userData, (address, uint256, uint256));

        uint256 balanceAfter = IERC20(flashToken).balanceOf(address(this));

        require(
            balanceAfter - balanceBefore == flashAmount,
            "FlashLoanTemplate: Contract did not get loan"
        );

        /// @notice Use the money here!
        emit FlashLoan(flashToken, flashAmount);

        IERC20(flashToken).transfer(
            address(vault),
            flashAmount + feeAmounts[0]
        );
    }
}
