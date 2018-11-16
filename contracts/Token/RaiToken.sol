pragma solidity ^0.4.21;
/**
 * 0xd1f2649e740752a48c381c944cb23202592f8e65 계약주소.. ,danet 소수점 8
 * 0xf19c96e82769ab1a52acdcce0c5769835f3d8d49  ropsten  소수점 18
 * 0xf19c96e82769ab1a52acdcce0c5769835f3d8d49  kovan 소수점 18
 * 0xf19c96e82769ab1a52acdcce0c5769835f3d8d49  main net 18
 *  920000000000000000000000000
 *  9200000000000000000000000000
 * 0x0ed22eee9eaf029db7caac48c7915ad59d7105de  main net 18, 92억
 */
import "./EIP20Interface.sol";


contract RaiToken is EIP20Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;
    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show.
    string public symbol;                 //An identifier: eg SBX

    constructor(
        string _name,
        string _sym,
        uint256 _initAmt,
        uint8 _decimal
    ) public {
        balances[msg.sender] = _initAmt;               // Give the creator all initial tokens
        totalSupply = _initAmt;                        // Update total supply
        name = _name;                                   // Set the name for display purposes
        decimals = _decimal;                            // Amount of decimals for display purposes
        symbol = _sym;                               // Set the symbol for display purposes
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}