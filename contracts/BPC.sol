pragma solidity ^0.4.11;

contract BPC {

    address public brand;
    address public owner;
    address public recipient;
    address public transporter;

    function BPC() {
        brand = msg.sender;
        owner = msg.sender;
    }
    
    modifier onlyBrand() {
	require(msg.sender == brand);
	_;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyRecipient() {
	require(recipient != address(0));
        require(msg.sender == recipient);
        _;
    }
    
    modifier onlyTransporter() {
	require(transporter != address(0));
	require(msg.sender == transporter);
	_;
    }

}