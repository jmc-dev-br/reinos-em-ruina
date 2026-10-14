// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title RoyalLedgerProof
/// @notice Records a learner wallet's successful answer to one of three public financial-literacy quests.
/// @dev This is an educational prototype. It records the wallet's claim of completing a quiz;
///      it is not identity verification, a credential about a real person's knowledge, or financial advice.
contract RoyalLedgerProof {
    mapping(address => mapping(uint8 => bool)) public completed;

    event ChallengeCompleted(
        address indexed learner,
        uint8 indexed challengeId,
        uint64 completedAt
    );

    error UnknownChallenge();
    error IncorrectAnswer();
    error AlreadyCompleted();

    /// @param challengeId 1 = budgeting, 2 = scam awareness, 3 = comparing debt costs.
    /// @param choice 1-based answer index for the selected challenge.
    function completeChallenge(uint8 challengeId, uint8 choice) external {
        if (challengeId == 0 || challengeId > 3) revert UnknownChallenge();
        if (completed[msg.sender][challengeId]) revert AlreadyCompleted();

        // Answers match the three Royal Ledger quests in index.html.
        bool correct;
        if (challengeId == 1) {
            correct = choice == 2;
        } else if (challengeId == 2) {
            correct = choice == 3;
        } else if (challengeId == 3) {
            correct = choice == 1;
        }

        if (!correct) revert IncorrectAnswer();

        completed[msg.sender][challengeId] = true;
        emit ChallengeCompleted(msg.sender, challengeId, uint64(block.timestamp));
    }
}