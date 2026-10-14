// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title ReinosChronicle
/// @notice Calculates and stores the first chapter's economic-policy outcome on Arc.
/// @dev The contract models fictional game values only. It never holds or transfers user funds.
///      It proves which policy a wallet submitted and which canonical outcome the contract computed;
///      it does not prove that the off-chain exploration or combat was completed honestly.
contract ReinosChronicle {
    struct ChapterSnapshot {
        bytes32 stateHash;
        uint64 recordedAt;
        uint32 treasury;
        uint32 debt;
        uint16 publicTrust;
        uint16 priceIndex;
        uint8 foodDays;
        uint8 policyId;
        bool exists;
    }

    mapping(address => mapping(uint8 => ChapterSnapshot)) public chronicles;

    event ChapterRecorded(
        address indexed player,
        uint8 indexed chapterId,
        uint8 indexed policyId,
        bytes32 stateHash,
        uint32 treasury,
        uint32 debt,
        uint16 publicTrust,
        uint16 priceIndex,
        uint8 foodDays,
        uint64 recordedAt
    );

    error InvalidChapter();
    error InvalidPolicy();
    error ChapterAlreadyRecorded();

    /// @notice Apply a policy to the initial state of chapter 1 and publish the result.
    /// @param chapterId Only chapter 1 ("The Broken Coin") is currently implemented.
    /// @param policyId 1 = repair trade road; 2 = borrow from guild; 3 = freeze prices.
    function recordChapter(uint8 chapterId, uint8 policyId) external returns (bytes32 stateHash) {
        if (chapterId != 1) revert InvalidChapter();
        if (policyId < 1 || policyId > 3) revert InvalidPolicy();
        if (chronicles[msg.sender][chapterId].exists) revert ChapterAlreadyRecorded();

        // Canonical starting economy shared by the browser prototype.
        uint32 treasury = 120;
        uint32 debt = 0;
        uint16 publicTrust = 55;
        uint16 priceIndex = 100;
        uint8 foodDays = 3;

        if (policyId == 1) {
            // Restore the trade road: spend now to improve supply and trust.
            treasury = 85;
            publicTrust = 67;
            priceIndex = 88;
            foodDays = 7;
        } else if (policyId == 2) {
            // Borrow 50 now and owe 60 later; the chapter models the liability as 60.
            treasury = 170;
            debt = 60;
            publicTrust = 58;
            priceIndex = 93;
            foodDays = 6;
        } else {
            // Freeze prices: lower the price index, but supply and trust fall.
            treasury = 120;
            debt = 0;
            publicTrust = 40;
            priceIndex = 80;
            foodDays = 2;
        }

        stateHash = keccak256(
            abi.encode(
                block.chainid,
                msg.sender,
                chapterId,
                policyId,
                treasury,
                debt,
                publicTrust,
                priceIndex,
                foodDays
            )
        );
        uint64 timestamp = uint64(block.timestamp);
        chronicles[msg.sender][chapterId] = ChapterSnapshot({
            stateHash: stateHash,
            recordedAt: timestamp,
            treasury: treasury,
            debt: debt,
            publicTrust: publicTrust,
            priceIndex: priceIndex,
            foodDays: foodDays,
            policyId: policyId,
            exists: true
        });

        emit ChapterRecorded(
            msg.sender,
            chapterId,
            policyId,
            stateHash,
            treasury,
            debt,
            publicTrust,
            priceIndex,
            foodDays,
            timestamp
        );
    }
}
