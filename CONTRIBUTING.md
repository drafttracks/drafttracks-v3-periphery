# Contributing to DraftTracks Protocol

Welcome, and thank you for your interest in contributing to the **DraftTracks** ecosystem.

This repository is part of the **DraftTracks Decentralized Artist Exchange (DEX)** — a protocol that enables on-chain liquidity, trading, and governance of artist tokens powered by $TRACK. It is adapted from Uniswap v3.

---

## 🚀 How to Contribute

We welcome the following contributions:

- 💻 Bug fixes  
- ⚙️ Gas optimizations  
- ✨ New feature proposals (e.g. artist-specific fee logic, LP incentives)  
- 🧪 Improved test coverage  
- 📄 Documentation updates

---

## 🛠️ Local Setup

1. Clone the repo:

   ```bash
   git clone https://github.com/DraftTracks/drafttracks-v3-core.git
   cd drafttracks-v3-core
   npm install
````

2. Compile the contracts:

   ```bash
   npm run compile
   ```

3. Run tests:

   ```bash
   npm run test
   ```

4. (Optional) Create a `.env` file for testnet or local deployment.

---

## 🌐 Related Repositories

* [`drafttracks-v3-periphery`](https://github.com/DraftTracks/drafttracks-v3-periphery) – Router, LP manager, and external interaction layer
* [`drafttracks-token`](https://github.com/DraftTracks/track-token) – ERC-20 token contract for \$TRACK
* [`drafttracks-artist-factory`](https://github.com/DraftTracks/artist-token-factory) – Artist token minting and registration

---

## 📦 Branching Strategy

* Always create a feature branch from `main`:

  ```bash
  git checkout -b feat/your-feature-name
  ```

* Use descriptive commit messages:

  ```
  feat: add battle reward hook support
  fix: correct fee tier logic for artist pairs
  ```

* Open a Pull Request (PR) to `main` once ready

* Link to any relevant Issues in your PR description

---

## 🧪 Testing

* All PRs must include test coverage for any new functionality
* We use **Hardhat + Chai** for smart contract testing
* Feel free to use Polygon Mumbai or Base Goerli for testnet validation

---

## 📄 License

All contributions are covered under the same **Business Source License (BSL 1.1)** used by Uniswap v3.
By contributing, you agree to the license terms until it converts to GPL on **April 1, 2025**.

---

## 💬 Questions?

Open an issue or contact us at:

* 📧 [jay@drafttracks.com](mailto:jay@drafttracks.com)
* 🌐 [https://drafttracks.com](https://drafttracks.com)

---

Thank you for helping shape the future of on-chain music and artist token economies 🎧


