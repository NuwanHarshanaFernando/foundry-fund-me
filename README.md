## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Crate a new project 

```shell
$ forge init
```

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

### To get the chainlink package

go to https://github.com/smartcontractkit/chainlink-brownie-contracts


```shell
$ forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit
        
$ forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit

```

or 

```shell
$ forge install smartcontractkit/chainlink-brownie-contracts

```

## Add remappings
In foundry.toml ->
remappings = [
    "@chainlink/contracts/=lib/chainlink-brownie-contracts/contracts/",
]