# ursa-contracts

> smart contracts for URSA

## Install

```
git submodule update --init
forge install
```

## Build

```
forge build
```

## Test

```
forge test -vv
```

## Deploy

### Deploy Locally

```
forge script script/UrsaAssetsDeploy.s.sol:Local --rpc-url http://localhost:8545 --broadcast
```
