// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

// UnitTest stub | dependencies | uml | draw.io 

contract TrusterLenderPool is ReentrancyGuard {

    IERC20 public damnValuableToken;

    //Constructor to set the damnValuableToken variable to the contract 
    //address associated with the ERC20 token
    constructor (address tokenAddress) public {
        damnValuableToken = IERC20 (tokenAddress);
    }

    //Flash loan function that takes external input including a TARGET 
    //address and Call data
    function flashLoan(
        uint256 borrowAmount, 
        address borrower, 
        address target,
        bytes calldata data
    )
        external 
        nonReentrant
    {   
        //Get the initial balance of the pool before the flash loan
        //and make sure there's enough tokens in the pool for the loan
        uint256 balanceBefore = damnValuableToken.balanceOf(address(this));
        require(balanceBefore >= borrowAmount, "Not enough tokens in pool");

        //Call damnValuableToken contract "transfer" function to send
        //the borrower the borrowAmount
        damnValuableToken.transfer(borrower, borrowAmount);

        //Call the target specified in the transaction and send data variable
        // This call will originate from the pool contract
        (bool success, ) = target.call(data);

        //External call must return success or revert will happen
        require(success, "External call failed");

        //check balance after call happens to ensure tokens were returned after flash loan
        uint256 balanceAfter = damnValuableToken.balanceOf(address(this));
        require(balanceAfter >= balanceBefore, "Flash loan hasn't been paid back");
    }
}