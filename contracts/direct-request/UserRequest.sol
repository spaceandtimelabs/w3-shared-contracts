// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./interfaces/ISxTRelayProxy.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @title User Request abstract contract
 * @notice Abstract user contract to be inherited by user contracts to set the SxTRelay and LINK token address
 * @notice The contract specifies some functions to be present in the user contract
 */
abstract contract UserRequest is ReentrancyGuard, ConfirmedOwner{

    /// @dev Zero Address
    address constant ZERO_ADDRESS = address(0);

    /// @dev SxT Request contract address
    ISxTRelayProxy internal sxtRelayContract;

    /// @dev Chainlink token address
    LinkTokenInterface internal chainlinkToken;

    /// @dev Current request Id
    bytes32 public currentRequestId;

    /** 
     * @dev The constructor sets the SxTRelay and validator contract address
     * @param sxtRelayAddress - Address of the SxT request contract address that has Oracle and Job initialized on it
     * @param chainlinkTokenAddress - Address of the LINK token that would be used for payment
     */
    constructor (ISxTRelayProxy sxtRelayAddress, LinkTokenInterface chainlinkTokenAddress, address ownerAddress) 
    ConfirmedOwner(ownerAddress)
    {
        require(sxtRelayAddress != ISxTRelayProxy(ZERO_ADDRESS), "UserRequest: Cannot set to Zero Address");
        require(chainlinkTokenAddress != LinkTokenInterface(ZERO_ADDRESS), "UserRequest: Cannot set to Zero Address");
        sxtRelayContract = sxtRelayAddress;
        chainlinkToken = chainlinkTokenAddress;
    }

    /**
     * @dev Modifier to constraint only the SxTRelay contract to call the function
     */
    modifier onlySxTRelay() {
        require(msg.sender == address(getSxTRelayContract().impl()), "UserRequest: Only callable by SxT Request Contract");
        _;
    }

    /**
     * @dev Get Instance of SxTRelay Contract to interact with
     * @return sxtRelayContract - Address of the SxTRelay contract address
     */
    function getSxTRelayContract() public view returns(ISxTRelayProxy) {
        return sxtRelayContract;
    }

    /**
     * @dev Get Instance of Chainlink token contract to interact with
     * @return chainlinkToken - Address of the LINK token contract
     */
    function getChainlinkToken() public view returns(LinkTokenInterface){
        return chainlinkToken;
    }
    
    /**
     * @dev Withdraw Chainlink from contract
     * @param to - Address to transfer the LINK tokens
     * @param amount - Amount of the LINK tokens to transfer
     */
    function withdrawChainlink(address to, uint256 amount) external nonReentrant onlyOwner {
        bool transferResult = chainlinkToken.transfer(
            to,
            amount
        );
        require(transferResult, "UserRequest: Chainlink token transfer failed");
    }

}