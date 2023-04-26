// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ISxTRelay.sol";

/**
 * @title The SxTRelayProxy contract interface
 * @notice Other contracts can use this interface to call SxTRelayProxy functions
 */
interface ISxTRelayProxy is ISxTRelay {
    
    /**
     * @dev Get the implementation SxTRelay contract address 
     */
    function impl() external view returns (ISxTRelay);

    /**
     * @dev Update implementation SxTRelay contract address 
     */
    function updateImpl(ISxTRelay sxtRelay) external;
    
}