// Blockchain product code

pragma solidity ^0.4.11;

contract BPC {
    enum Status { NEW, RECALLED }

    address public brand;
    address public owner;
    address public recipient;
    address public transporter;
    Status public status;
    address[] public requests;

    function BPC() {
        brand = msg.sender;
        owner = msg.sender;
        status = Status.NEW;
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

    function recall() onlyBrand {
        status = Status.RECALLED;
    }

    function requestOwnership() {
        requests.push(msg.sender);
    }

    function acceptOwnership(address newOwner) onlyOwner {
        require(newOwner != address(0));
        require(newOwner != owner);
        for (uint i = 0; i < requests.length; i++) {
            if (requests[i] == newOwner) {
                owner = newOwner;
            }
        }

        if (owner == newOwner) {
            delete requests;
        }
    }

}