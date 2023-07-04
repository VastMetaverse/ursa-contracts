// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract UrsaAssets is ERC1967Proxy {
    constructor(
        address __logicContractAddress
    ) ERC1967Proxy(__logicContractAddress, "") {}
}
