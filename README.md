# NTT Bridge

A bridge for transferring native tokens across different blockchains, powered by Wormhole.
This repository tracks all Mezo bridgeable tokens supported by the Wormhole bridge. The code structure of each token on
a given network largely mirrors that of the [Wormhole native token transfer repository](https://github.com/wormhole-foundation/native-token-transfers). For comprehensive documentation, refer to the [Wormhole native token transfer docs](https://wormhole.com/docs/products/native-token-transfers/overview/).

## Bridgeable tokens

### MUSD on **Mainnet**

| Chain | Mode |
|-------|---------------|
| Mezo  | Locking |
| Ethereum  | Burning |

## Configuration

One of the building blocks of the NTT Bridge is the `deployment.json` file. This file
is a critical configuration that defines the complete state of an NTT (Native Token Transfer)
Bridge deployment across multiple blockchain networks. This file contains all the necessary
information about deployed contracts, [access control](https://wormhole.com/docs/products/native-token-transfers/configuration/access-control/), their configurations, and the relationships between different chains in the bridge network.

## NTT CLI

The NTT CLI is a tool that allows you to manage native token transfers across multiple
blockchain networks. For available commands refer to the [NTT CLI documentation](https://wormhole.com/docs/products/native-token-transfers/reference/cli-commands/#ntt-cli-commands).

## Project Structure

The structure of the project is organized to support multiple tokens, each with both testnet and mainnet configurations. Here is a high-level layout:

``` text
|- ntt-bridge
|-- musd
|--- testnet
|--- mainnet
|-- etc. (other tokens)
```

Each token directory contains:

- `testnet` directory for testnet configuration
- `mainnet` directory for mainnet configuration

## Git

This project uses git subtrees. The goal is to track not only changes
made specifically to this project, but also changes made
to the Wormhole's [native-token-transfers](https://github.com/wormhole-foundation/native-token-transfers) repository.

Here are a couple of example commands for testnet `musd`
marked by `--prefix=musd/testnet`, but you can use the same commands for other
tokens. In this example, `musd-testnet` is your local name for the Wormhole remote.

```bash
# Add the Wormhole remote to .git/config
git remote add musd-testnet https://github.com/wormhole-foundation/native-token-transfers

# Fetch all the latest changes from Wormhole remote
git fetch musd-testnet 

# Pull the latest changes from Wormhole remote into the subtree
git subtree pull --prefix=musd/testnet musd-testnet main --squash

# If you want to work on a different branch other than Wormhole's main branch
git subtree pull --prefix=musd/testnet musd-testnet <branch> --squash

# If you wish to add a new token, you can do so by adding a new directory in the root of the project
git subtree add --prefix=<other-token/network> <other-token-remote> main --squash

# Pull your new token config locally
git subtree pull --prefix=<other-token/network> <other-token-remote> main --squash

# Push your new token to this repository
git subtree push --prefix=<other-token/network> <other-token-remote> main
```

To push your changes, just follow the normal git flow. Create a branch off of `main`,
make your changes, and create a PR against `main`.
