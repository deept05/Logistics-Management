// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Logistics {

    address public Owner;

    struct Package {
        bool isUidGenerated;
        uint itemId;
        string itemName;
        string transitStatus;
        uint orderStatus;

        address customer;
        uint orderTime;

        address carrier1;
        uint carrier1Time;

        address carrier2;
        uint carrier2Time;

        address carrier3;
        uint carrier3Time;
    }

    mapping(address => Package) public packageMapping;
    mapping(address => bool) public carriers;

    constructor() {
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(Owner == msg.sender, "Only the owner can perform this action.");
        _;
    }

    function manageCarriers(address _carrierAddress) public onlyOwner returns (string memory) {
        carriers[_carrierAddress] = !carriers[_carrierAddress];
        return "Carrier status updated";
    }

    function orderItem(uint _itemId, string memory _itemName) public returns (address) {
        address uniqueId = generateUniqueId(msg.sender);

        Package storage newPackage = packageMapping[uniqueId];
        initializePackage(newPackage, _itemId, _itemName, msg.sender);

        return uniqueId;
    }

    function cancelOrder(address _uniqueId) public returns (string memory) {
        require(packageMapping[_uniqueId].isUidGenerated, "Invalid package ID");
        require(packageMapping[_uniqueId].customer == msg.sender, "Only the customer can cancel the order");

        packageMapping[_uniqueId].orderStatus = 4;
        packageMapping[_uniqueId].transitStatus = "Your order has been canceled";

        return "Your order has been canceled successfully!";
    }

    function carrier1Report(address _uniqueId, string memory _transitStatus) public {
        require(packageMapping[_uniqueId].isUidGenerated, "Invalid package ID");
        require(carriers[msg.sender], "Unauthorized carrier");
        require(packageMapping[_uniqueId].orderStatus == 1, "Invalid order status");

        updateTransitStatus(_uniqueId, _transitStatus);
        packageMapping[_uniqueId].carrier1 = msg.sender;
        packageMapping[_uniqueId].carrier1Time = block.timestamp;
        packageMapping[_uniqueId].orderStatus = 2;
    }

    function carrier2Report(address _uniqueId, string memory _transitStatus) public {
        require(packageMapping[_uniqueId].isUidGenerated, "Invalid package ID");
        require(carriers[msg.sender], "Unauthorized carrier");
        require(packageMapping[_uniqueId].orderStatus == 2, "Invalid order status");

        updateTransitStatus(_uniqueId, _transitStatus);
        packageMapping[_uniqueId].carrier2 = msg.sender;
        packageMapping[_uniqueId].carrier2Time = block.timestamp;
    }

    function carrier3Report(address _uniqueId, string memory _transitStatus) public {
        require(packageMapping[_uniqueId].isUidGenerated, "Invalid package ID");
        require(carriers[msg.sender], "Unauthorized carrier");
        require(packageMapping[_uniqueId].orderStatus == 2, "Invalid order status");

        updateTransitStatus(_uniqueId, _transitStatus);
        packageMapping[_uniqueId].carrier3 = msg.sender;
        packageMapping[_uniqueId].carrier3Time = block.timestamp;
        packageMapping[_uniqueId].orderStatus = 3;
    }

    function generateUniqueId(address customer) internal view returns (address) {
        return address(uint160(uint(keccak256(abi.encodePacked(customer, block.timestamp)))));
    }

    function initializePackage(
        Package storage newPackage,
        uint _itemId,
        string memory _itemName,
        address customer
    ) internal {
        newPackage.isUidGenerated = true;
        newPackage.itemId = _itemId;
        newPackage.itemName = _itemName;
        newPackage.transitStatus = "Your package is ordered and is under process";
        newPackage.orderStatus = 1;
        newPackage.customer = customer;
        newPackage.orderTime = block.timestamp;
    }

    function updateTransitStatus(address _uniqueId, string memory _transitStatus) internal {
        packageMapping[_uniqueId].transitStatus = _transitStatus;
    }
}
