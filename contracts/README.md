# spaceandtime/contracts
SxT Contracts | Public Chainlink Contracts

This repository has all the public contracts available via npm module.

If you wish to use the Space and Time smart contracts to send data to your smart contracts that uses Chainlink for fulfilling the requests submitted. These smart contracts would be helpful to create your own contracts inheriting these contracts.

```sh
# via npm
$ npm install @spaceandtime/contracts --save
```

### Directory Structure

```sh
@spaceandtime/contracts
├── direct-request # Direct Request smart contracts
│   ├── interfaces
│   ├── UserRequest.sol
└── functions # Function smart contracts
    ├── interfaces
    ├── vendor
    ├── Functions.sol
    └── FunctionsClient.sol
```

### Usage

The solidity smart contracts themselves can be imported via the `direct-request` and `functions` directory of `@spaceandtime/contracts`:

```solidity
import '@spaceandtime/contracts/direct-request/UserRequest.sol';

import '@spaceandtime/contracts/functions/FunctionsClient.sol';
```

## License

[MIT](https://choosealicense.com/licenses/mit/)