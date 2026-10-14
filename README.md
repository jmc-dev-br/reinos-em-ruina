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
- Main menu with Play and Language options (Portuguese and English menu UI).
- Three independent local save slots, each with Continue, Customize, and Delete actions.
- Character creator with masculine/feminine appearance, name, four outfits, cloak color, hair color, and skin tone.
- Character appearance is rendered in both top-down exploration and side-view combat and saved with the selected slot.
- Legacy browser save is imported into Slot 1 once to preserve earlier progress.
- Quest progression, XP/levels, health, potions, inventory economy, manual and milestone save/load.
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

## Atualização do protótipo: combate tático e atividades de ausência

O protótipo agora inclui uma batalha experimental por cartas, aberta pelo botão **Cartas táticas** quando o jogador se aproxima de uma criatura. Cada turno tem 3 pontos de energia; as cartas permitem ataque rápido, ataque pesado, bloqueio ou uso de poção. Vencer entrega as recompensas existentes de XP e cobre fictício. Esta mecânica é local e para um jogador, não PvP.

O botão **Atividade** permite ao personagem treinar (+12 XP/hora) ou trabalhar na taverna (+5 cobres fictícios/hora) enquanto o jogador está ausente, limitado a 8 horas por reivindicação. Isso usa o relógio e o armazenamento locais do navegador; é uma conveniência experimental, não um serviço online seguro.

O plano completo está em [docs/ROADMAP_MVP_ONLINE.md](docs/ROADMAP_MVP_ONLINE.md). Guildas, objetivos mundiais compartilhados, recompensas offline verificadas e PvP assíncrono precisam de um backend confiável e de um banco de dados. Não devem ser apresentados como recursos compartilhados globalmente enquanto o site for estático.

## New prototype update: living world and player progression

The browser prototype now includes:
- Local-time day/night tinting, animated pond highlights, selectable rain/leaves/automatic weather, and simple pixel particles.
- Combat feedback with floating damage/healing text, impact shake, synthesized sound effects, and an optional procedural ambient melody. Effects, weather, lighting, sounds and music can be configured in the in-game menu.
- Daily entry rewards with a streak bonus, personal achievements, and gathering professions (mining, herbology and fishing).
- A local materials loop: collect ore and herbs, craft a healing potion, or refine ore into fictional copper.

These progression systems are stored in local browser storage and organized by save slot where applicable. They are not synchronized between browsers or users. Daily rewards and offline activity are conveniences for this prototype, not security-sensitive server-authoritative game systems.

The online plan remains in [docs/ROADMAP_MVP_ONLINE.md](docs/ROADMAP_MVP_ONLINE.md). Global events every three hours, an auction house shared between users, co-op dungeons, guild structures and public achievements need authenticated server APIs and database transactions. They are roadmap items—not live multiplayer features.
