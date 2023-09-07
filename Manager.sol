 // SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Manager {
    string usertype1;
    string usertype2;
    address public owner;

    
        string usertype;
        bool registered;
   

    mapping(address => string) public users;

    constructor(string memory _type1, string memory _type2) {
        usertype1 = _type1;
        usertype2 = _type2;
        owner = msg.sender;
    }

    function user_register(string memory usertype ) public
    {
        require(
            keccak256(bytes(usertype)) == keccak256(bytes(usertype1)) ||
                keccak256(bytes(usertype)) == keccak256(bytes(usertype2)),
            "Invalid user type"
        );
      
    
        // users[msg.sender] = User( usertype, true);
    }

   function getUserType(address _address) public view returns (string memory) {
    require(users[_address].registered, "User is not registered");
    
//display all the users created by this address
    return users[_address].usertype;
    }

    function isUserRegistered(address _address) public view returns (bool) {
        return users[_address].registered;
    }
}
