# Arc Microgrants — Submission Draft (Do Not Submit Yet)

This file contains the prepared submission text. It is intentionally marked **NOT READY TO SUBMIT** until the Arc Mainnet contract is deployed, configured in the game, and tested end-to-end.

## 1. Project title
**Realms in Ruin: The Broken Coin**

## 2. One-line tagline
**A medieval action RPG where economic decisions change the fate of a kingdom.**

## 3. Short description
Realms in Ruin is a medieval RPG that blends top-down exploration with side-view combat and a living fictional economy. In its opening chapter, The Broken Coin, players investigate missing food shipments and choose how the village of Brumaforte responds: repair a trade road, borrow from a guild, or freeze prices. Each policy creates a different trade-off across treasury, debt, public trust, food reserves, and prices. Instead of pausing the adventure for a finance quiz, the game teaches economic concepts through story, play, and consequences.

## 4. What the project uses Arc for
The planned Arc integration, ReinosChronicle, records a player's chapter-one economic policy and the outcome calculated by the smart contract itself. The contract deterministically computes the fictional treasury, debt, public trust, price index, and food reserves for the chosen policy; it then stores a timestamped receipt and emits a public event. This gives the demo a concrete on-chain mechanic without creating a speculative game token or transferring/custodying player funds.

**Important:** The source code and wallet adapter are prepared, but the contract is not yet deployed. This section describes the intended live feature and must not be presented as active until the Mainnet deployment, contract address, and end-to-end transaction are verified.

## 5. What is already built
- Top-down map exploration and NPC interaction.
- Side-view combat in the ruins, including enemies, health, experience, and progression.
- An opening quest about missing shipments and unreliable records.
- A council with three distinct economic policies and different outcomes.
- A game dashboard for treasury, debt, public trust, food reserves, and a price index.
- Merchant prices that respond to the simulated price index.
- An in-game codex covering money, budgeting, inflation, interest, fraud, and crypto risks.
- Browser save/load controls.
- A Solidity contract source and an optional ethers.js wallet adapter for the future Arc Mainnet receipt.
- Automated GitHub checks for JavaScript syntax, frontend/contract interface wiring, and Solidity compilation.

## 6. Suggested demo walkthrough
1. Open the game and move around Brumaforte using WASD or arrow keys.
2. Talk to Mara near the village square with E or Enter.
3. Use the scene buttons or Tab to enter the side-view ruins and try the combat controls.
4. Return to the village and open **Conselho do reino**.
5. Choose one of the three policies and inspect how the economic dashboard changes.
6. Visit the merchant and compare item costs under the new simulated price index.
7. Open the finance codex with M to explore supporting concepts.

When the contract is live, add a final step showing the wallet's chapter receipt and the Arc Explorer transaction link. Do not connect a wallet or claim a transaction before then.

## 7. Links
- **Browser demo:** https://jmc-dev-br.github.io/reinos-em-ruina/jogar.html
- **Main menu:** https://jmc-dev-br.github.io/reinos-em-ruina/
- **Public source repository:** https://github.com/jmc-dev-br/reinos-em-ruina
- **Public builder profile:** https://github.com/jmc-dev-br
- **Contract source:** https://github.com/jmc-dev-br/reinos-em-ruina/blob/main/contracts/ReinosChronicle.sol

## 8. Required fields to complete after deployment
- Verified Arc Mainnet contract address.
- Deployment transaction link on the official Arc Explorer.
- A confirmed `ChapterRecorded` transaction from the deployed frontend.
- Successful fresh-browser walkthrough of the live demo.
- Confirm current event is accepting submissions before pressing Submit.

## 9. Eligibility gate
The Arc Microgrants program explicitly requires a project already deployed and working on Arc Mainnet at submission time. Do not submit this draft while the contract address remains blank or while the only available implementation is source code/testnet. The grant is competitive and is not guaranteed.

## 10. Safety and transparency
All copper and economy metrics are fictional game values. The contract records a wallet's selected policy and a deterministic result computed on-chain; it does not prove that off-chain exploration/combat was completed honestly. It does not hold or transfer user funds. Mainnet transactions consume real USDC for gas and should only be done with responsible adult supervision if the builder is a minor, after testing and reviewing the transaction details. Never share a seed phrase or private key.
