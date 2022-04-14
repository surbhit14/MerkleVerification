// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//Import for OpenZeppelin MerkteProof contract. This will allow us to use 
// the 'Merkle Proof.verify method. 
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
contract merkletree {


bytes32 public merkleRoot = 0x77e700f03437c8e81143fabca89ab927d28d5207bf6ed00aa9b4d8ed5cdd6f7c;
mapping (address => bool) public tokenclaimed;

function merkle_verification (bytes32[] calldata _merkleProof) public {

require(!tokenclaimed[msg.sender], "Address has already been claimed.");

bytes32 leaf = keccak256(abi.encodePacked (msg.sender)); 
require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), "Invalid proof.");

tokenclaimed[msg.sender] = true;


}

}