// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {IGovernor} from "./IGovernor.sol";

interface IGovernorZK {
    error WrongState(IGovernor.ProposalState actual, IGovernor.ProposalState expected);
    error AlreadyCommitted(uint256 proposalId, address voter);
    error NotEligible(address voter);
    error InvalidCommitment(uint256 commitment);
    error NotImplemented();

    function registerCommitment(uint256 proposalId, uint256 commitment) external;
    function castVote(
        uint256 proposalId,
        uint8 support,
        uint256 nullifier,
        uint256 root,
        uint256[2] calldata proof_a,
        uint256[2][2] calldata proof_b,
        uint256[2] calldata proof_c
    ) external;
    function castVoteWithReason(
        uint256 proposalId,
        uint8 support,
        string memory reason,
        uint256 nullifier,
        uint256 root,
        uint256[2] calldata proof_a,
        uint256[2][2] calldata proof_b,
        uint256[2] calldata proof_c
    ) external;
}
