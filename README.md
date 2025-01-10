# Logistics-Management

## Overview
This repository contains a Solidity smart contract for managing logistics operations. It allows customers to order items, carriers to update the transit status, and owners to manage carriers.

 ## Features
## Order Management:

Place an order and generate a unique ID.
Cancel an order.
## Carrier Management:

Add or remove carriers by the contract owner.
Report transit status updates by carriers.
## Access Control:

Owner can manage carriers.
Only authorized carriers can update the transit status.
Contract Details
Contract Name: Logistics
Solidity Version: 0.8.26
Owner: Address of the contract deployer
## Key Functions:
manageCarriers(address _carrierAddress)
orderItem(uint _itemId, string _itemName)
cancelOrder(address _uniqueId)
carrier1Report(address _uniqueId, string _transitStatus)
carrier2Report(address _uniqueId, string _transitStatus)
carrier3Report(address _uniqueId, string _transitStatus)
## How to Use
Deploy the Contract: Deploy the contract using a Solidity-compatible environment like Remix or Truffle.

Manage Carriers: The owner can add or remove carriers using the manageCarriers function.

Place an Order: Customers can place orders using the orderItem function, receiving a unique ID for their package.

Cancel an Order: Customers can cancel their orders using the cancelOrder function.

Carrier Reporting: Authorized carriers can update the transit status of packages using the carrier1Report, carrier2Report, and carrier3Report functions.

## License
This project is licensed under the MIT License.
