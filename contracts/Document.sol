// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Document {
    mapping(bytes32 => bool) private documentHashes;

    event documentHashStored(bytes32 indexed documentHash);

    function storeDocumentHash(bytes32 documentHash) public {
        documentHashes[documentHash] = true;
        emit documentHashStored(documentHash);
    }

    function storeDocumentHashes(bytes32[] memory hashes) public {
        for(uint256 i=0; i<hashes.length; i++) {
            documentHashes[hashes[i]] = true;
            emit documentHashStored(hashes[i]);
        }   
    }

    function verifyDocumentHash(bytes32 documentHash) public view returns (bool) {
        return documentHashes[documentHash];
    }
}