This project demonstrates a basic Case of Executing  Denial of Service  Attack in Smart Contrats. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Notice how Attack.sol will lead Good.sol into a DOS attack. First address1 will become the current winner by calling setCurrentAuctionPrice on Good.sol then Attack.sol will become the current winner by sending more ETH than address1 using the attack function. Now when address2 will try to become the new winner, it won't be able to do that because of this check(if (sent)) present in the Good.sol contract which verifies that the current winner should only be changed if the ETH is sent back to the previous current winner.

Since Attack.sol doesn't have a fallback function which is necessary to accept ETH payments, sent is always false and thus the current winner is never updated and address2 can never become the current winner

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
