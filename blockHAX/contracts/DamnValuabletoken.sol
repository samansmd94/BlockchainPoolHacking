// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DamnValuableToken is ERC20 {

    // Decimals are set to 18 by default in `ERC20`
    constructor() public ERC20("DamnValuableToken", "DVT") {
        _mint(0xCCC22051FC163442254C7B6A0F152Bdf6032F5cB , 1e24 );
    }
}