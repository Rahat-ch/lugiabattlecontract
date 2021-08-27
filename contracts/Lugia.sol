// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Lugia {
    uint256 totalDamage;
    uint256 totalHp = 50000;
    uint256 charizardHp = 50000;
    uint256 charizardAttack = 500;
    uint256 lugiaAttack = 700;
    uint256 charizardDamage;
    uint256 charizardRecover;

    event NewAction(
        address indexed from,
        uint256 timestamp,
        string message,
        uint256 lugiahp,
        uint256 zardhp
    );

    struct Action {
        address trainer;
        string message;
        uint256 timestamp;
        uint256 lugiahp;
        uint256 zardhp;
    }

    Action[] actions;

    constructor() {
        console.log("this gonna be the lugia smart contract");
    }

    function attack(string memory _message) public {
        totalDamage += charizardAttack;
        totalHp -= charizardAttack;
        charizardDamage += lugiaAttack;
        charizardHp -= lugiaAttack;
        console.log("%s has attacked the shadow Lugia!", msg.sender);
        console.log("%s was attacked back by shadow Lugia!", msg.sender);
        actions.push(
            Action(msg.sender, _message, block.timestamp, totalHp, charizardHp)
        );
        emit NewAction(
            msg.sender,
            block.timestamp,
            _message,
            totalHp,
            charizardHp
        );
    }

    function getAllActions() public view returns (Action[] memory) {
        return actions;
    }

    function getCurrentHp() public view returns (uint256) {
        uint256 currentHp = totalHp - totalDamage;
        console.log("The Shadow Lugia has %d hp remaining", currentHp);
        return currentHp;
    }

    function getCurrentCharizardHp() public view returns (uint256) {
        uint256 currentHp = charizardHp - charizardDamage;
        console.log("Charizard has %d hp remaining", currentHp);
        return currentHp;
    }

    function potion(string memory _message) public {
        charizardHp += 1000;
        console.log("%s used a potion!", msg.sender);
        actions.push(
            Action(msg.sender, _message, block.timestamp, totalHp, charizardHp)
        );
        emit NewAction(
            msg.sender,
            block.timestamp,
            _message,
            totalHp,
            charizardHp
        );
    }
}
