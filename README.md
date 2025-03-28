# DNFT Protocol

❗️ **This is a dev playground, not an NFT project 🙈**
This repo is a personal Solidity + blockchain practice project.

I’m a junior developer learning to build decentralized protocols.  
**DNFT is my sandbox for testing on-chain SVG NFTs, ERC721 logic, and permission-based marketplace approval.**  
The goal of this project is to use it as a foundation for my future NFT marketplace protocol.

---

## 🚀 What’s here

- Dynamic on-chain SVG NFT logic
- ERC721 `approveMarketplace()` experiments
- On-chain metadata encoding (Base64)
- Testing NFT approvals and permissions

---

## ❗️ Disclaimer

**This is NOT an art drop, commercial project, or production-ready contract.**  
It’s a learning project built as part of my blockchain dev journey.  
Use at your own risk.

---

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
