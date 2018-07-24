pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';



/**
 * @title ETRAToken token
 * @dev StandardToken modified by ETRA
 **/
contract RaiToken is Ownable {

  constructor(
    uint256 _min_wei,//최소 사용 wei?
    uint256 _max_wei, //최대 사용 wei?
    uint256 _rate,// 보상비율 ?
    address _wallet, // eth 수신 주소 ?
    uint256 _cap, // 보상비율
    string _name, // 코인명?
    string _symbol, // 코인심벌
    uint8 _decimals // 사용할 소수점 계수.
  )

}