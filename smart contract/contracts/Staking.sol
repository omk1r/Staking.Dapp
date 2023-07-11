//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Staking is ERC20 {
    constructor() ERC20("Testtoken","TEST"){
        _mint(msg.sender,1000000);
    }

    mapping(address => uint256) public staked;
    mapping(address => uint256) public stakedTs;

    function buy(uint256 amount) external payable {
    uint256 tokenPrice = 0.1 ether; // Price of one token in wei
    uint256 totalPrice = tokenPrice * amount;
    
    require(amount > 0, "You have to at least buy something");
    require(msg.value == totalPrice, "Please send the correct amount of ether to buy tokens");
    
    _mint(msg.sender, amount);
}

    function stake(uint32 amount) external {
        require(amount > 0 , "amount should be greater than zero");
        require(balanceOf(msg.sender) >= amount,"You don't have enough balance");
        staked[msg.sender] += amount;
        stakedTs[msg.sender] = block.timestamp;
        _transfer(msg.sender,address(this),amount);
    }

    function unstake() external {
        require(staked[msg.sender] > 0,"you haven't staked any token");
        claim();
        uint256 amount = staked[msg.sender];
        staked[msg.sender] = 0;
        _transfer(address(this),msg.sender,amount);
    }

    function claim() public {
        require(staked[msg.sender] > 0,"you haven't staked any token");
        uint256 secondsStaked = block.timestamp - stakedTs[msg.sender] ;
        uint256 reward = staked[msg.sender] * secondsStaked / 10000000;
        _mint(msg.sender,reward);
        stakedTs[msg.sender] = 0;
    }
}