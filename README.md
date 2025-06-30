# NTT Bridge

A bridge for transferring native tokens across different blockchains powered by Wormhole.

## Git

This project uses git subtrees to track Wormhole [native-token-transfer](https://github.com/wormhole-foundation/native-token-transfer) dependencies which this project is based on. The goal is to track not only changes made specifically to this project resulted in a token deployment (e.g. `deployment.json` config file or other created artifacts), but also changes made to the Wormhole's native token transfer repository. Structure is as follows:

``` text
|- ntt-bridge
|-- musd
|--- testnet
|--- mainnet
|-- etc. (other tokens)
```

`testnet` and `mainnet` directories mirror the Wormhole's native token transfer repository. You can fetch and pull the latest changes from Wormhole for latest features and bug fixes. Here are a couple of example commands for testnet `musd` marked by `--prefix=musd/testnet`, but you can use the same commands for other tokens. In this example `musd-testnet` is your local name of the Wormhole remote.

```bash
# Add the Wormhole remote to .git/config
git remote add musd-testnet https://github.com/wormhole-foundation/native-token-transfers

# Fetch all the latest changes from Wormhole remote
git fetch musd-testnet 

# Pull the latest changes from Wormhole remote into the subtree
git subtree pull --prefix=musd/testnet musd-testnet main --squash

# If you want to work on a different branch othen than Wormhole's main branch
git subtree pull --prefix=musd/testnet musd-testnet <branch> --squash

# If you wish to add a new token, you can do so by adding a new directory in the root of the project
git subtree add --prefix=<other-token/network> <other-token-remote> main --squash

# Pull your new token config locally
git subtree pull --prefix=<other-token/network> <other-token-remote> main --squash

# Push your new token to this repository
git subtree push --prefix=<other-token/network> <other-token-remote> main
```

When you want to push your changes just follow the normal git flow. Create a branch off of `main`, make your changes, and create a PR against `main`.
