pragma solidity 0.7.3;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract ERC721OZ is ERC721 {
    constructor() ERC721('token name', 'token symbol') {}
}

contract ERC721OZ is ERC721 {
    constructor() ERC721('token name', 'token symbol') {
        _safeMint(msg.sender, 0);
    }
}

contract ERC721OZ is ERC721 {
    address public admin;

    constructor() ERC721('token name', 'token symbol') {
        admin = msg.sender;
    }

    function mint(address to, uint tokenId) external {
        require(msg.sender == admin, "only admin");
        _safeMint(to, tokenId);
    }
}

contract ERC721OZ is ERC721 {

    constructor() ERC721('token name', 'token symbol') {
    }

    function faucet(address to, uint tokenId) external {
        _safeMint(to, tokenId);
    }
}
