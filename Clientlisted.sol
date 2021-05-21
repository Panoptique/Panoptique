pragma solidity ^0.4.26;

import "./MultiOwn.sol";

contract Clientlisted is MultiOwn {

    mapping(address => bool) public clientlist;

      /**
  * @dev Throws if called by any account other than the owner.
  */
  modifier notClientlisted() {
      require(clientlist[msg.sender] == false);
      _;
  }

   /**
   * @dev Adds single contract address to clientlist. Not personal account address, but contract address.
   * @param _client contract address to be added to the clientlist.
   */
  function addToClientlist(address _client) external onlyOwner {
    clientlist[_client] = true;
  }

   /**
   * @dev Adds list of contract addresses to clientlist. Not overloaded due to limitations with truffle testing.
   * @param _clients contract addresses to be added to the clientlist.
   */
  function addManyToClientlist(address[] _clients) external onlyOwner {
    for (uint256 i = 0; i < _clients.length; i++) {
      client[_clients[i]] = true;
    }
  }

  /**
   * @dev Removes single contract address from clientlist. Not personal account address, but contract address.
   * @param _client contract address to be removed to the clientlist.
   */
  function removeFromClientlist(address _client) external onlyOwner {
    clientlist[_client] = false;
  }
}
