//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract SimpleStorgae{
    uint256 favouriteNumber; //This is initialized as zero
    mapping(string => uint256) public nameTofavouriteNumber;
    // People public person1=People({favouriteNumber:1, name:Rohit});
    // People public person2=People({favouriteNumber:2, name:ABCX});

    struct People{
     string name;
     uint favouriteNumber;
    }
    
    //uint256[] public favouriteNumber; (This is how u create an array)
    People[] public people;


    function store(uint256 _favouriteNumber) public{
        favouriteNumber=_favouriteNumber;
         // When you call No gas view/pure func in main func it will consume storage and gas fees will be applied on it
    }

    //pure: No storage used(no gas fees) When you dont want to return anything or perform math or algorithms
    //view: No storage used (no gas fees) when you want to return something
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public{
       // People memory newPerson = People({name: _name, favouriteNumber: _favouriteNumber});
       //People memory newPerson = People(_name, _favouriteNumber);
       // people.push(newPerson);
       people.push(People(_name, _favouriteNumber));
       nameTofavouriteNumber[_name] = _favouriteNumber;
    }
    // EVM can store info in 6 places, 3 of them are calldata,memory,storage
    // calldata: temporary storage; can't modify info
    // memory: temporary storage; can modify info
    // storage: permanent storage; can modify info
    // You dont need to specify data location for uint as its by default 'memory' for that
    // specific function but data location(memory,calldata) needs to be specified for 
    // [Arrays(string), struct, mapping] behind the scenes string is an array of bytes
    // since _name isn't getting stored anywhere you cant even add 'storage' instead of memory
    // and therefore you specify it as memory/calldata

}
