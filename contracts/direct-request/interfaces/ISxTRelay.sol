// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * @title The SxTRelay contract interface
 * @notice Other contracts can use this interface to call SxTRelay functions
 */
interface ISxTRelay {

    /**
     * @dev Event emitted when the LINK token fee is updated 
     */
    event LinkTokenFeeUpdated(uint256 newFee);

    /**
     * @dev Get the fees for calling the SxT Request Query 
     */
    function feeInLinkToken() external view returns (uint256);

    /**
     * @dev Get the current request ID  
     */
    function currentRequestId() external view returns (bytes32);
    
    /**
     * @dev Set Chainlink operator contract address
     * @param newOperator - Address of the new operator contract deployed
     */
    function setChainlinkOperator(address newOperator) external;

    /**
     * @dev Withdraw Chainlink from contract
     * @param to - Address to transfer the LINK tokens
     * @param amount - Amount of the LINK tokens to transfer
     */
    function withdrawChainlink(address to, uint256 amount) external;

    /**
     * @dev Update the LINK token fee for each request
     * @param newFee - New fee for Chainlink request in LINK token
     */
    function updateLinkTokenFee(uint256 newFee) external;

    /**
     * @dev Execute the request query and response type as string2D
     * @param query - SQL query requested by User contract
     * @param resourceId - Request id requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestQueryString2D(
        string memory query, 
        string memory resourceId, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request query and response type as uint256
     * @param query - SQL query requested by User contract
     * @param resourceId - Request id requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestQueryUint256(
        string memory query, 
        string memory resourceId, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request query and response type as bytes
     * @param query - SQL query requested by User contract
     * @param resourceId - Request id requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestQueryBytes(
        string memory query, 
        string memory resourceId, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request query and response type as string
     * @param query - SQL query requested by User contract
     * @param resourceId - Request id requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestQueryString(
        string memory query, 
        string memory resourceId, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request view and response type as string2D
     * @param viewName - view name requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestViewString2D(
        string memory viewName, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request view and response type as uint256
     * @param viewName - view name requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestViewUint256(
        string memory viewName, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request view and response type as bytes
     * @param viewName - view name requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestViewBytes(
        string memory viewName, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Execute the request view and response type as string
     * @param viewName - view name requested by User contract
     * @param callerContract - User contract address that called this requestQuery function
     * @param callbackFunctionId - User contract callback function selector id
     * @param chainlinkJobId - Chainlink Job ID that SxT team has created on the Chainlink Oracle Node
     */
    function requestViewString(
        string memory viewName, 
        address callerContract, 
        bytes4 callbackFunctionId,
        string memory chainlinkJobId
    ) external returns (bytes32);

    /**
     * @dev Chainlink off-chain request callback function to fulfil the request for string2D response
     * @param requestId - The unique id of the request for which the function is triggered
     * @param data - The response data received for the query
     * @param errorMessage - The error message received for the query
     */
    function queryResponseString2D(
        bytes32 requestId, 
        string[][] calldata data,
        string calldata errorMessage
    ) external;

    /**
     * @dev Chainlink off-chain request callback function to fulfil the request for uint256 response
     * @param requestId - The unique id of the request for which the function is triggered
     * @param data - The response data received for the query
     * @param errorMessage - The error message received for the query
     */
    function queryResponseUint256(
        bytes32 requestId, 
        uint256 data,
        string calldata errorMessage
    ) external;

    /**
     * @dev Chainlink off-chain request callback function to fulfil the request for bytes response
     * @param requestId - The unique id of the request for which the function is triggered
     * @param data - The response data received for the query
     * @param errorMessage - The error message received for the query
     */
    function queryResponseBytes(
        bytes32 requestId, 
        bytes calldata data,
        string calldata errorMessage
    ) external;

    /**
     * @dev Chainlink off-chain request callback function to fulfil the request for string response
     * @param requestId - The unique id of the request for which the function is triggered
     * @param data - The response data received for the query
     * @param errorMessage - The error message received for the query
     */
    function queryResponseString(
        bytes32 requestId, 
        string calldata data,
        string calldata errorMessage
    ) external;
}
