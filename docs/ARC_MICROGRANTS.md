# Arc Microgrants submission draft

## Project
**Realms in Ruin: The Broken Coin**  
Portuguese title: **Reinos em Ruína: A Moeda Partida**

## One-line pitch
A medieval RPG where players learn how money works by exploring a kingdom, fighting through its ruins, and living with the consequences of economic policy—not by answering a financial quiz.

## What is playable
- Top-down exploration through Brumaforte and its NPCs.
- Side-view combat in the ruins, with enemies, health, experience, and fictional copper.
- A story quest about missing trade shipments and distorted market prices.
- A playable council decision with three competing policies: repair the trade road, borrow from the guild, or freeze prices.
- A living simulation dashboard for treasury, debt, public trust, food reserves, and a price index.
- Merchant prices react to the simulated price index.
- Browser save/load and an in-game finance codex covering budgeting, inflation, interest, scams, and crypto risks.

## What Arc is for
The optional **ReinosChronicle** contract is designed to anchor a timestamped chapter receipt on Arc Mainnet. The client submits only the selected policy ID. The contract independently calculates the chapter's canonical fictional-economy outcome (treasury, debt, public trust, price index, and food reserves), hashes that result with keccak256, and emits a public receipt. This creates a tamper-evident reference for a player's campaign choice without transferring game currency or custodying user funds.

The receipt proves that a wallet submitted a policy and records the result computed by the contract. It does not prove that the player completed the off-chain exploration and combat honestly.

## Public links
- Game: https://jmc-dev-br.github.io/reinos-em-ruina/jogar.html
- Main menu: https://jmc-dev-br.github.io/reinos-em-ruina/
- Public repository: https://github.com/jmc-dev-br/reinos-em-ruina
- Contract source: https://github.com/jmc-dev-br/reinos-em-ruina/blob/main/contracts/ReinosChronicle.sol

## Important deployment status
**Do not submit this draft as an eligible Arc Microgrant build until the contract has actually been deployed and tested on Arc Mainnet and its address has been configured in `jogar.html`.** The repository currently contains contract source and a prepared client adapter; source code alone is not a Mainnet deployment. A deployment requires a wallet controlled by the builder and a small amount of native USDC for gas. Never share a seed phrase or private key with anyone.

## Risk and honesty notes
- All in-game currency and economic figures are fictional and have no cash value.
- The app does not custody, transfer, swap, or promise returns on real funds.
- Connecting a wallet is optional.
- Mainnet transactions are irreversible and incur network fees in USDC.
- The contract records self-reported gameplay data, not verified achievements or identity.
