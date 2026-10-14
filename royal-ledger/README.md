# Royal Ledger — Financial Quest

Royal Ledger is a small, browser-based educational prototype inspired by *Realms in Ruin*. It teaches three practical financial-literacy ideas through medieval scenarios:

1. Budgeting and emergency reserves.
2. Warning signs of financial scams.
3. Comparing the total cost of debt.

## Important project status

- The browser quiz works locally and stores quiz progress in the current browser.
- \`contracts/RoyalLedgerProof.sol\` is the on-chain component source.
- The app is configured for **Arc Testnet** by default.
- The on-chain feature is not live until the contract has been deployed and its address is added to \`CONTRACT_ADDRESS\` in \`index.html\`.
- A testnet-only build is **not eligible** for Arc Microgrants. The program requires a working deployment on Arc Mainnet at submission time.
- This prototype does not take deposits, send payments, hold user funds, or ask for personal financial data. Testnet tokens have no cash value.

## Network settings

Current browser configuration is Arc Testnet:

- Chain ID: \`5042002\`
- RPC: \`https://rpc.testnet.arc.io\`
- Explorer: \`https://explorer.testnet.arc.io\`
- Testnet USDC faucet: [Circle Faucet](https://faucet.circle.com/)

Official Arc network details: [Connect to Arc](https://docs.arc.io/arc/references/connect-to-arc).

## Contract behavior

A connected wallet may record one successful completion for each challenge. The contract checks a fixed expected choice and emits \`ChallengeCompleted(learner, challengeId, completedAt)\`. The chain record contains a public wallet address, a numeric challenge ID, and timestamp. It does not store a real name or the answer history.

This is an educational prototype, not a secure examination or an attestation of identity. The correct choices are part of the public source code and can be inspected. The UI only asks for a transaction after the user chooses to record a correct answer.

## Test and deploy process

1. Read and review the Solidity contract before deploying.
2. Use Remix or another Solidity toolchain to compile with Solidity 0.8.24 or compatible 0.8.x.
3. Deploy to Arc Testnet first; connect a wallet on testnet and try a correct and incorrect answer.
4. After the test works, decide with a trusted adult whether to deploy on Arc Mainnet. Arc Mainnet uses USDC as native gas, and mainnet transactions involve real value.
5. For a mainnet build, deploy a separate contract to Mainnet and update the frontend network configuration and \`CONTRACT_ADDRESS\`. Do not point the testnet UI at a mainnet contract or vice versa.

## Scope and limitations

No backend, identity verification, multiplayer, on-chain scores beyond challenge completion, or real-money features are included. The learning content is general information, not financial advice.
