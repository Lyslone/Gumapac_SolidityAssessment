// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

/**
 * @custom:dev-run-script NatSpec
 */
contract MyToken {
    // 1. Public variables to store details about the coin
    string public tokenName;
    string public tokenAbbreviation;
    uint public totalSupply;

    // 2. Mapping of addresses to balances
    mapping(address => uint) public balances;

    // 3. Mint function
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // 4. Burn function
    function burn(address _address, uint _value) public {
        // 5. Conditional to ensure sufficient balance
        require(balances[_address] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_address] -= _value;
    }

    // Initialize the token details in the constructor
    constructor() {
        tokenName = "My Token";
        tokenAbbreviation = "MTK";
        totalSupply = 0;
    }
}
