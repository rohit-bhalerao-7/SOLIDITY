//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

//This will inherit all functionalities of SimpleStorage
contract ExtraStorage is SimpleStorage{ 
 
   function store(uint256 _favouriteNumber) public override{
       favouriteNumber = _favouriteNumber + 5;
   }

}
