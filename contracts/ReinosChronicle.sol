// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title ReinosChronicle
/// @notice Stores a timestamped, public receipt of a player's simulated kingdom policy.
/// @dev The game state is self-reported by the caller. This contract does not certify
///      that the player actually completed a quest and never holds or transfers user funds.
contract ReinosChronicle {
    struct ChapterSnapshot {
        bytes32 stateHash;
        uint64 recordedAt;
        uint32 treasury;
        uint32 debt;
        uint16 publicTrust;
        uint16 priceIndex;
        bool exists;
    }

    mapping(address => mapping(uint8 => ChapterSnapshot)) public chronicles;

    event ChapterRecorded(
        address indexed player,
        uint8 indexed chapterId,
        bytes32 indexed stateHash,
        uint32 treasury,
        uint16 publicTrust,
        uint16 priceIndex,
        uint32 debt,
        uint64 recordedAt
    );

    error InvalidChapter();
    error ChapterAlreadyRecorded();
    error InvalidEconomySnapshot();

    /// @notice Publish one decision snapshot for a chapter.
    /// @param chapterId Chapter number (currently chapter 1 is playable).
    /// @param stateHash SHA-256 hash of the canonical game snapshot shown by the client.
    /// @param treasury Simulated kingdom treasury in fictional copper units.
    /// @param debt Simulated kingdom debt in fictional copper units.
    /// @param publicTrust Simulated public trust, from 0 to 100.
    /// @param priceIndex Simulated price index; 100 is the starting baseline.
    function recordChapter(
        uint8 chapterId,
        bytes32 stateHash,
        uint32 treasury,
        uint32 debt,
        uint16 publicTrust,
        uint16 priceIndex
    ) external {
        if (chapterId == 0 || chapterId > 3) revert InvalidChapter();
        if (chronicles[msg.sender][chapterId].exists) revert ChapterAlreadyRecorded();
        if (publicTrust > 100 || priceIndex < 50 || priceIndex > 300) {
            revert InvalidEconomySnapshot();
        }

        uint64 timestamp = uint64(block.timestamp);
        chronicles[msg.sender][chapterId] = ChapterSnapshot({
            stateHash: stateHash,
            recordedAt: timestamp,
            treasury: treasury,
            debt: debt,
            publicTrust: publicTrust,
            priceIndex: priceIndex,
            exists: true
        });

        emit ChapterRecorded(
            msg.sender,
            chapterId,
            stateHash,
            treasury,
            publicTrust,
            priceIndex,
            debt,
            timestamp
        );
    }
}
