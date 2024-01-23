// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract University_AstanaIT_Assanali is ERC20 {
    // Constants
    string public constant SYMBOL = "UAA";
    string public constant NAME = "University_AstanaIT_Assanali";
    uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 2000 * (10**uint256(DECIMALS));

    // Events
    event LatestTransactionInfo(string timestamp, address sender, address receiver);

    // Constructor
    constructor() ERC20(NAME, SYMBOL) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function timestampToDate(uint256 timestamp) internal pure returns (string memory) {
    // Convert the timestamp to a simple date format with time (YYYY-MM-DD HH:mm:ss)
    // Calculate year
    uint256 secondsInYear = 31536000; // seconds in a year
    uint256 year = timestamp / secondsInYear + 1970;

    // Calculate month
    uint256 secondsInMonth = 2629746; // average seconds in a month
    uint256 month = (timestamp % secondsInYear) / secondsInMonth + 1;

    // Calculate day
    uint256 secondsInDay = 86400; // seconds in a day
    uint256 day = (timestamp % secondsInMonth) / secondsInDay + 1;

    // Calculate hour
    uint256 secondsInHour = 3600; // seconds in an hour
    uint256 hour = (timestamp % secondsInDay) / secondsInHour;

    // Calculate minute
    uint256 secondsInMinute = 60; // seconds in a minute
    uint256 minute = (timestamp % secondsInHour) / secondsInMinute;

    // Calculate second
    uint256 second = timestamp % secondsInMinute;

    // Create a string in the format "YYYY-MM-DD HH:mm:ss"
    string memory dateTimeString = string(abi.encodePacked(
        _uintToString(year), "-",
        _uintToString(month), "-",
        _uintToString(day), " ",
        _uintToString(hour), ":",
        _uintToString(minute), ":",
        _uintToString(second)
    ));

    return dateTimeString;
    }

    // Function to return the human-readable date of the latest transaction
    function getLatestTransactionTimestamp() external view returns (string memory) {
        require(block.number > 0, "No transactions have occurred yet");
        uint256 blockTimestamp = block.timestamp;
        return timestampToDate(blockTimestamp);
    }

    // Function to retrieve the address of the transaction sender
    function getTransactionSender() external view returns (address) {
        return _msgSender();
    }

    // Function to retrieve the address of the transaction receiver
    function getTransactionReceiver() external view returns (address) {
        return address(this);
    }

    // Internal function to convert uint256 to a string
    function _uintToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    // Override transfer function to emit LatestTransactionInfo event
    function transfer(address to, uint256 amount) public override returns (bool) {
        bool success = super.transfer(to, amount);
        if (success) {
            emit LatestTransactionInfo(_uintToString(block.timestamp), _msgSender(), to);
        }
        return success;
    }

    // Override transferFrom function to emit LatestTransactionInfo event
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        bool success = super.transferFrom(from, to, amount);
        if (success) {
            emit LatestTransactionInfo(_uintToString(block.timestamp), from, to);
        }
        return success;
    }
}