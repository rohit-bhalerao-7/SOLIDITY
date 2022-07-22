//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public {
      SimpleStorage simpleStorage = new SimpleStorage();
      simpleStorageArray.push(simpleStorage);
    }

    //To interact with any contract you need 'Address' and 'ABI(Application Binary Interface)'
    //When you import, ABI is already taken care of and array is taking care of address

    //sfStore function is to store value at any index in SimpleStorage using StorageFactory
    //Basically interacting with SimpleStorage by storing number in it.

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
      return simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
      //SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
      //SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
      //simpleStorage.store(_simpleStorageNumber);
    }
    
     

    //This function is created to read 'store' function from SimpleStorage
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
      return simpleStorageArray[_simpleStorageIndex].retrieve();
      //SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
      //return simpleStorage.retrieve();
    }


    //To store number in new index you need to click createSimpleStorage
}
