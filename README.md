# Realms in Ruin / Reinos em Ruína

**A medieval RPG where economic choices change the world.**  
Aventura medieval em que as decisões econômicas mudam o reino.

## Play the browser prototype

- **[Play the game](https://jmc-dev-br.github.io/reinos-em-ruina/jogar.html)**
- [Open the main menu](https://jmc-dev-br.github.io/reinos-em-ruina/)
- [Arc Microgrants pitch and deployment checklist](docs/ARC_MICROGRANTS.md)

## The game

Reinos em Ruína is not a finance quiz. Players explore the kingdom from a top-down perspective, enter side-view combat in ruined locations, meet characters, complete quests, collect fictional copper, and learn from the results of their decisions.

The opening chapter, **The Broken Coin / A Moeda Partida**, puts the village of Brumaforte under pressure after food shipments disappear. The player investigates the attacks on the road, finds a ledger in the ruins, brings evidence back to the guard Mara, and only then unlocks the council's three imperfect policy choices:

1. **Repair the trade road** — spend treasury now to improve food supplies, lower price pressure, and raise public trust.
2. **Borrow from the guild** — obtain resources immediately but take on a larger repayment obligation.
3. **Freeze prices** — reduce the displayed price index quickly while weakening supply and merchant trust.

The decision changes the kingdom dashboard and the merchant's prices. The player can inspect the trade-offs instead of being told there is one universally correct answer.

## Core features

- Top-down map exploration and NPC interaction.
- Side-view action/combat in the ruins.
- A sequenced first-chapter quest: investigate road attacks, find unique ledger evidence, report to Mara, and complete the council decision.
- Quest rewards cannot be repeatedly claimed from the same ledger; important story milestones autosave locally.
- Quest progression, XP/levels, health, potions, inventory economy, manual/automatic save/load.
- Fictional kingdom economy: treasury, debt, public trust, food reserves, and price index.
- Dynamic merchant prices connected to the simulated price index.
- In-game codex with plain-language topics: budgeting, inflation, interest, scams, and crypto risks.
- Responsive controls and browser-only play; no real-money game mechanics.

## Arc integration: ReinosChronicle

The Solidity source at [contracts/ReinosChronicle.sol](contracts/ReinosChronicle.sol) defines a minimal contract for publishing a timestamped chapter snapshot to Arc. The frontend's optional adapter prepares a SHA-256 hash of the player's chosen policy and the simulated outcome, then writes the hash and public economy metrics to the contract.

The intent is deliberately narrow:
- No game-token speculation or token purchase is required.
- The contract never holds or transfers player funds.
- A transaction records the player's own declared snapshot; it does not prove the gameplay was honest.
- Arc Mainnet gas is paid in native USDC, so any real deployment requires the wallet owner to understand and approve the cost.

### Deployment status

**The Arc contract is not yet deployed.** The contract source and frontend adapter are prepared, but the live on-chain feature cannot be used until the contract is deployed on Arc Mainnet and its address is configured in `jogar.html`. Until then, describe Arc integration as prepared, not live. The project does not satisfy the Arc Microgrants Mainnet requirement until this step is completed and verified.

## Controls

- Map: WASD or arrow keys.
- Interact: E / Enter.
- Switch between map and ruins: Tab or use the scene buttons.
- Attack: J.
- Jump in side-view combat: Space / W / Up.
- Finance codex: M.
- Shop: T when near the merchant.
- Potion: H.
- Save: use the on-screen Save button.

## Technical scope

The game is a static HTML/CSS/JavaScript prototype suitable for GitHub Pages. The optional Arc client uses ethers.js v6 and an injected EVM wallet provider. The contract is Solidity `^0.8.24`.

## Disclaimer

This is an educational prototype, not financial advice. Copper, treasury, debt and prices are fictional game values. The Arc contract stores a public game-state commitment and selected metrics; do not put confidential or identifying information in on-chain data. Smart contracts may contain bugs and on-chain transactions are irreversible.
