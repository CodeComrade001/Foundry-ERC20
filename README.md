# 🪙 Foundry-ERC20

A lightweight ERC20-style token implementation using [Foundry](https://book.getfoundry.sh/). This token supports minting, burning, transferring, approving, and allowance-based transactions. Built without OpenZeppelin to help understand the mechanics of ERC20 from scratch.

---

## 🚀 Features

- ✅ Mint on deploy (constructor initializes total supply)
- ✅ Basic transfers
- ✅ `approve` / `transferFrom` mechanism
- ✅ `approveAndCall` external interaction
- ✅ Burn tokens (`burn`, `burnFrom`)
- ✅ Events: `Transfer`, `Approval`, `Burn`

---

## 🧠 Smart Contract Properties

| Property          | Type       | Description                                    |
|------------------|------------|------------------------------------------------|
| `name`           | `string`   | Token name (set in constructor)               |
| `symbol`         | `string`   | Token symbol (set in constructor)             |
| `decimals`       | `uint8`    | Always 18 — standard ERC20 format             |
| `totalSupply`    | `uint256`  | Total supply of tokens                        |
| `balanceOf`      | `mapping`  | Tracks balances of each address               |
| `allowance`      | `mapping`  | Approved spending limits                      |

### 🔁 Core Functions

- `transfer(address to, uint256 value)`: Send tokens to another address.
- `approve(address spender, uint256 value)`: Approve a spender to use your tokens.
- `transferFrom(address from, address to, uint256 value)`: Transfer on behalf of another address.
- `burn(uint256 value)`: Destroy your own tokens.
- `burnFrom(address from, uint256 value)`: Destroy tokens from another address using allowance.
- `approveAndCall(address spender, uint256 value, bytes calldata extraData)`: Approve and trigger callback on external contract.

---

## 🧰 Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Node.js](https://nodejs.org/) (for tooling or integration)
- A Solidity-compatible wallet for deployment or testing

---

## ⚙️ Getting Started

### 1. Clone the Repository


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
