// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserRegistration {

    struct User {
        string name;
        string email;
        bool exists;
    }

    mapping(address => User) private users;

    event UserRegistered(address indexed userAddress, string name, string email);

   
    function registerUser(string calldata _name, string calldata _email) external {
        require(!users[msg.sender].exists, "User already registered");

        users[msg.sender] = User({
            name: _name,
            email: _email,
            exists: true
        });

        emit UserRegistered(msg.sender, _name, _email);
    }

    
    function getUser(address _userAddress) public view returns (string memory, string memory) {
        require(users[_userAddress].exists, "User not found");
        User memory user = users[_userAddress];
        return (user.name, user.email);
    }
    function isRegistered(address _user) public view returns (bool) {
    return users[_user].exists;
    }
}
