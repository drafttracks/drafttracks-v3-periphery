# DraftTracks v3 Periphery

> 🧩 Periphery smart contracts for the [DraftTracks](https://dex.drafttracks.com) Decentralized Artist Exchange (DEX), adapted from Uniswap v3. Enables token-based swaps, liquidity provisioning, and artist token interactions using $TRACK.

---

## 🔍 Overview

This repository contains the **periphery contracts** used by the DraftTracks protocol. These contracts provide the logic required to interact with the [drafttracks-v3-core](https://github.com/DraftTracks/drafttracks-v3-core), including:

- Routing for token swaps (e.g. $TRACK ↔ artist tokens)
- Non-fungible LP position management
- Quoting utilities and liquidity math
- DraftTracks-specific extensions for artist token use cases

The DraftTracks DEX empowers fans to support artists (human or AI) by trading artist tokens, staking into battles, and fueling tokenized music careers through $TRACK.

---

## 📦 Included Contracts

| Contract | Description |
|----------|-------------|
| `SwapRouter.sol` | Main interface for executing token swaps |
| `NonfungiblePositionManager.sol` | Manages Uniswap v3 liquidity positions (minted as NFTs) |
| `Quoter.sol` | Utility contract for estimating swap outcomes |
| `DraftTracksHooks.sol` *(planned)* | (Optional) Hook interface for DraftTracks voting, tipping, or AI reward extensions |

---

## 🔗 Related Repos

- [`drafttracks-v3-core`](https://github.com/DraftTracks/drafttracks-v3-core) — Core pool logic (Uniswap v3 fork)
- [`drafttracks-artist-factory`](https://github.com/DraftTracks/artist-token-factory) — Mint artist tokens and register them with the DEX
- [`drafttracks-token`](https://github.com/DraftTracks/track-token) — The $TRACK utility/governance token

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/DraftTracks/drafttracks-v3-periphery.git
cd drafttracks-v3-periphery
npm install
````

### 2. Compile Contracts

```bash
npm run compile
```

### 3. Configure for Deployment (Hardhat)

Edit your `hardhat.config.js`:

```js
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.20",
  networks: {
    polygon: {
      url: process.env.POLYGON_RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
```

Add `.env` with:

```
PRIVATE_KEY=your_wallet_private_key
POLYGON_RPC_URL=https://polygon-mainnet.g.alchemy.com/v2/YOUR_KEY
```

---

## 🧪 Deployment Order (Typical)

1. Deploy core DEX contracts (`drafttracks-v3-core`)
2. Deploy:

   * `SwapRouter`
   * `NonfungiblePositionManager`
   * `$TRACK` token
   * Any artist tokens via `ArtistTokenFactory`
3. Create LP pools for `$TRACK / $ARTIST`
4. Use `SwapRouter` to allow trading via frontend or app

---

## 🎨 Use Cases

* 🔁 Enable swaps between \$TRACK and artist tokens
* 🎧 Support LP incentives via artist battles or tipping
* 🖼 Use LP NFTs for gamified fan rewards or battle achievements
* 🧠 Integrate with DraftTracks AI Producers (e.g. AI battle logic, drop planning)

---

## 🔐 License

This repo is originally derived from [Uniswap v3-periphery](https://github.com/Uniswap/v3-periphery), licensed under **Business Source License 1.1 (BSL-1.1)** by Uniswap Labs. Commercial use is restricted until **April 1, 2025**.

---

## 📣 Contact

Built and maintained by the [DraftTracks](https://drafttracks.com) protocol team.

For integration requests, security disclosures, or contributions, reach out to:

* 💼 Jason Amos – `jay@drafttracks.com`
* 💬 Join the waitlist & community: [drafttracks.com](https://dex.drafttracks.com)
