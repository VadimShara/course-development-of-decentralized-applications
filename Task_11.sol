// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_11 {
    address public owner;
    uint public targetAmount;
    uint public totalUserDeposits; // (1) сумма всех депозитов

    enum State { Active, Paused, Closed }
    State public state;

    mapping(address => uint) public balances;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event StateChanged(State newState);

    // (2) модификатор onlyOwner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    modifier whenActiveOrPaused() {
        require(
            state == State.Active || state == State.Paused,
            "Unavailable in closed state"
        );
        _;
    }

    modifier whenActive() {
        require(state == State.Active, "Contract is not active");
        _;
    }

    // (3) модификатор whenClosed
    modifier whenClosed() {
        require(state == State.Closed, "Contract is not closed");
        _;
    }

    constructor(uint _targetAmount) {
        require(_targetAmount > 0, "Target amount should be > 0");
        owner = msg.sender;
        targetAmount = _targetAmount;
        state = State.Active;
    }

    // (4) функция deposit
    function deposit() external payable whenActive {
        require(msg.value > 0, "Deposit must be greater than zero");

        balances[msg.sender] += msg.value;
        totalUserDeposits += msg.value;

        emit Deposited(msg.sender, msg.value);

        // автоматическое закрытие при достижении цели
        if (totalUserDeposits >= targetAmount) {
            state = State.Closed;
            emit StateChanged(state);
        }
    }

    function pause() external onlyOwner whenActiveOrPaused {
        require(state != State.Paused, "Contract paused");
        state = State.Paused;
        emit StateChanged(state);
    }

    function resume() external onlyOwner {
        require(state == State.Paused, "Contract is not paused");
        state = State.Active;
        emit StateChanged(state);
    }

    // (5) функция withdraw
    function withdraw() external {
        require(state == State.Paused, "Fund withdraw available only if paused");

        uint userBalance = balances[msg.sender];
        require(userBalance > 0, "No funds to withdraw");

        balances[msg.sender] = 0;
        totalUserDeposits -= userBalance;

        (bool success, ) = payable(msg.sender).call{value: userBalance}("");
        require(success, "ETH transfer failed");


        emit Withdrawn(msg.sender, userBalance);
    }

    function ownerWithdrawAll() external onlyOwner whenClosed {
        uint contractBalance = address(this).balance;
        require(contractBalance > 0, "No fund to withdraw");

        (bool success, ) = payable(owner).call{value: contractBalance}("");
        require(success, "Owner withdraw failed");

        balances[owner] = 0;
        totalUserDeposits = 0;
    }

    function getState() external view returns (string memory) {
        if (state == State.Active) return "Active";
        if (state == State.Paused) return "Paused";
        if (state == State.Closed) return "Closed";
        return "";
    }
}
