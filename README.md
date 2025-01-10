--## Smart Contract

### Overview
This repository contains a Solidity smart contract for managing logistics operations. It allows customers to order items, carriers to update the transit status, and owners to manage carriers.

### Features
1. **Order Management:**
   - Place an order and generate a unique ID.
   - Cancel an order.

2. **Carrier Management:**
   - Add or remove carriers by the contract owner.
   - Report transit status updates by carriers.

3. **Access Control:**
   - Owner can manage carriers.
   - Only authorized carriers can update the transit status.

### Contract Details

- **Contract Name:** Logistics
- **Solidity Version:** 0.8.26
- **Owner:** Address of the contract deployer
- **Key Functions:**
  - `manageCarriers(address _carrierAddress)`
  - `orderItem(uint _itemId, string _itemName)`
  - `cancelOrder(address _uniqueId)`
  - `carrier1Report(address _uniqueId, string _transitStatus)`
  - `carrier2Report(address _uniqueId, string _transitStatus)`
  - `carrier3Report(address _uniqueId, string _transitStatus)`

### How to Use

1. **Deploy the Contract:**
   Deploy the contract using a Solidity-compatible environment like Remix or Truffle.

2. **Manage Carriers:**
   The owner can add or remove carriers using the `manageCarriers` function.

3. **Place an Order:**
   Customers can place orders using the `orderItem` function, receiving a unique ID for their package.

4. **Cancel an Order:**
   Customers can cancel their orders using the `cancelOrder` function.

5. **Carrier Reporting:**
   Authorized carriers can update the transit status of packages using the `carrier1Report`, `carrier2Report`, and `carrier3Report` functions.

### License
This project is licensed under the MIT License.

