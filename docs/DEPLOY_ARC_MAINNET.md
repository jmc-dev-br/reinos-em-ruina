# Arc Mainnet deployment checklist — read before sending a transaction

The browser game and contract source are prepared, but **the Arc feature is not live yet**. Do not describe it as deployed, and do not submit an Arc Microgrant application as eligible until a real Arc Mainnet deployment has been confirmed.

## Safety first

- If the builder is under 18, have a parent/guardian or responsible adult supervise any wallet or real-network step.
- Do not share a recovery phrase, private key, wallet export, or remote-control access with anyone—including someone offering to help.
- Do not use money needed for daily life. The contract has not been independently audited, and deploying or interacting with it uses real USDC for gas.
- Test the source first on a testnet and review the transaction details before considering Mainnet. Testnet USDC has no cash value.

## Source and network

- Contract: `contracts/ReinosChronicle.sol`
- Compiler target: Solidity `0.8.24` (no external imports)
- Arc Mainnet chain ID: `5042`
- RPC: `https://rpc.mainnet.arc.io`
- Explorer: `https://explorer.arc.io`
- Arc documentation: https://docs.arc.io/arc/references/connect-to-arc

Arc uses native USDC to pay gas. A wallet may display the native balance differently depending on its support for custom gas tokens; check the official Arc docs.

## Deployment outline

1. Open the official Remix IDE at https://remix.ethereum.org.
2. Create a new Solidity file and paste the contents of `contracts/ReinosChronicle.sol`.
3. Select Solidity compiler 0.8.24, compile, and inspect every compiler warning or error. Do not deploy if compilation fails.
4. Before any mainnet deployment, exercise the contract on Arc Testnet and verify the expected event and duplicate-chapter rejection.
5. In Remix's deployment panel, use the wallet-injected provider. Confirm that the wallet is on **Arc Mainnet (5042)**, that the selected contract is `ReinosChronicle`, and that the wallet shows a fee you understand.
6. Deploy only after the source and transaction have been reviewed. Save the contract address and deployment transaction hash; check them in the official Arc Explorer.
7. In `jogar.html`, replace the empty value in `const CHRONICLE_CONTRACT_ADDRESS='';` with the deployed contract address, then commit the change to GitHub.
8. Wait for GitHub Pages to deploy the update. In a fresh browser session, choose a council policy, connect the wallet only when the configured contract is visible, and make one chapter-record transaction. Confirm the `ChapterRecorded` event in the explorer.
9. Add the game URL, public repository, contract address, transaction link, and a concise explanation of Arc's role to the DoraHacks build submission.

## What a record does—and does not do

The contract publishes a wallet address, chapter number, snapshot hash, timestamp, and fictional economy metrics. It does not move the game's fictional copper, hold game funds, or validate the honesty of the off-chain gameplay. Treat all on-chain data as public and permanent.

**Current status: contract source written; frontend adapter prepared; Mainnet deployment and end-to-end transaction still pending.**
