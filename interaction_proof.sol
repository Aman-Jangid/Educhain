// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InteractionLogger {

    // Struct to store interaction details
    struct Interaction {
        uint256 timestamp;
        address user;
    }

    // Array to store all interactions
    Interaction[] public interactions;

    // Function to log interaction (no inputs required)
    function logInteraction() public {
        Interaction memory newInteraction = Interaction({
            timestamp: block.timestamp,
            user: msg.sender
        });

        interactions.push(newInteraction);
    }

    // Function to get the number of interactions logged
    function getInteractionCount() public view returns (uint256) {
        return interactions.length;
    }

    // Function to retrieve a specific interaction
    function getInteraction(uint256 index) public view returns (uint256 timestamp, address user) {
        require(index < interactions.length, "Invalid index");
        Interaction memory interaction = interactions[index];
        return (interaction.timestamp, interaction.user);
    }
}
