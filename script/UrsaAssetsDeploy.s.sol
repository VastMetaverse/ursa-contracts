// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@forge/Script.sol";
import {UrsaAssets} from "../src/UrsaAssets.sol";
import {UrsaAssetsLogic} from "../src/UrsaAssetsLogic.sol";

contract Local is Script {
    function run() public {
        // Test Account 0
        uint256 deployer = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
        vm.startBroadcast(deployer);

        // Deploy Asset Categories Logic Contract
        UrsaAssetsLogic assetsLogicContract = new UrsaAssetsLogic();

        // Deploy Asset Categories Proxy Contract
        UrsaAssets assetsProxyContract = new UrsaAssets(
            address(assetsLogicContract)
        );

        // Get Asset Categories Contract
        UrsaAssetsLogic assetsContract = UrsaAssetsLogic(
            address(assetsProxyContract)
        );
        assetsContract.initialize();

        assetsContract.createBatch(1000);

        assetsContract.mint(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720, 1, 1);
        assetsContract.mint(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720, 2, 1);
        assetsContract.mint(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720, 3, 1);

        vm.stopBroadcast();
    }
}

contract Testnet is Script {
    function run() public {
        // Test Account 0
        uint256 deployer = vm.envUint("TESTNET_DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployer);

        // Deploy Asset Categories Logic Contract
        UrsaAssetsLogic assetsLogicContract = new UrsaAssetsLogic();
        assetsLogicContract.initialize();

        // Deploy Asset Categories Proxy Contract
        UrsaAssets assetsProxyContract = new UrsaAssets(
            address(assetsLogicContract)
        );

        // Get Asset Categories Contract
        UrsaAssetsLogic assetsContract = UrsaAssetsLogic(
            address(assetsProxyContract)
        );
        assetsContract.initialize();

        assetsContract.createBatch(1000);

        vm.stopBroadcast();
    }
}

contract Mainnet is Script {
    function run() public {
        // Test Account 0
        uint256 deployer = vm.envUint("MAINNET_DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployer);

        // Deploy Asset Categories Logic Contract
        UrsaAssetsLogic assetsLogicContract = new UrsaAssetsLogic();
        assetsLogicContract.initialize();

        // Deploy Asset Categories Proxy Contract
        UrsaAssets assetsProxyContract = new UrsaAssets(
            address(assetsLogicContract)
        );

        // Get Asset Categories Contract
        UrsaAssetsLogic assetsContract = UrsaAssetsLogic(
            address(assetsProxyContract)
        );
        assetsContract.initialize();

        assetsContract.createBatch(1000);

        vm.stopBroadcast();
    }
}
