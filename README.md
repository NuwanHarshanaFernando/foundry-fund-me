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

## To print the test output

```shell
$ forge test -vv

```

## To Deploy

Create DeployFundMe.s.sol inside script folder
Then deploy

```shell
$ forge script script/DeployFundMe.s.sol

```

To Run only a particular test case, use m

```shell
$ forge test -m testPriceFeedVersionIsAccurate

```
    or 

```shell
$ forge test --match-test testPriceFeedVersionIsAccurate

```
Add SEPOLIA_RPC_URL to .env

In terminal -> 

```shell
   $ source .env
    $ echo $SEPOLIA_RPC_URL
```

Run on a fork-url

```shell
$ forge test --match-test testPriceFeedVersionIsAccurate -vvvvv --fork-url $SEPOLIA_RPC_URL

```
The anvil act like it's on sepolia now [When we test using fork-url, It's like running on the actual chain]
We get 4 as the output. 
Check on alchemy now.

## Coverage

```shell
$ forge coverage --fork-url $SEPOLIA_RPC_URL

```

Test again
```shell
$ forge test --fork-url $SEPOLIA_RPC_URL

```
Now testcase failed -> testOwnerIsMsgSender
Because the deployer is the sender again

```
contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.stopBroadcast();
        return fundMe;
    }
}
```

To avoid this error, change this source to that

assertEq(fundMe.i_owner(), address(this)); To assertEq(fundMe.i_owner(), msg.sender);

```
  function testOwnerIsMsgSender() public {
        console.log(fundMe.i_owner());
        console.log(msg.sender);
        //  assertEq(fundMe.i_owner(), msg.sender); // Fails because of (us -> FundMeTest -> FundMe)
        assertEq(fundMe.i_owner(), address(this)); // Now test pass
    }
```

```
  function testOwnerIsMsgSender() public {
        console.log(fundMe.i_owner());
        console.log(msg.sender);
        //  assertEq(fundMe.i_owner(), msg.sender); // Fails because of (us -> FundMeTest -> FundMe)
        assertEq(fundMe.i_owner(), msg.sender); // Now test pass
    }
```

## Mock

Create a file called HelperConfig.s.sol inside script folder

- Create a new project called Mainnet in Alchemy
- Set the RPC-URL in .env 

Then test on fork-url mainnet

```shell
$ forge test --fork-url $MAINNET_RPC_URL

```

# Mock 
Create a folder called mocks inside test folder


Get the MockV3Aggregator from the github repo

Now run command

```shell
$ forge test 

```

It runs much faster because there is no API calls

## Cheatcodes

https://getfoundry.sh/forge/tests/cheatcodes/

https://getfoundry.sh/reference/cheatcodes/assertions














