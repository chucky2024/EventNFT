//SPDX-License-Identifier : MIT
pragma solidity ^0.8.26;

    "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTEvent {

    address public owner;
    uint public duration;//time the events will last
    uint public ticket;
    uint public noOfAttendants;
    address public eventMaster;

        struct EventInfo{
            address[] attendees;
            uint date;
            uint time;
            uint ticketId;
        }

    mapping(address => mapping(uint => bool)) public hasMintedTicket;//checks if an attendee already has an NFT.
    mapping(uint => EventInfo ) public events;//stores event information.

    address[] public attendants;

    constructor (address _owner, address _eventMaster) external {
            require(owner[msg.sender] != address(0),"Invalid address");
            require(eventMaster != address(0),"Invalid address");

            owner = _owner;

            eventMaster = _eventMaster;

    modifier onlyOwner{
        require(owner == msg.sender,"Only owner can perform this action")
        _;
    }

    modifier onlyeventMaster{
        require(eventMaster == msg.sender,"Only Event Master can perform this action")
        _;
    }

        function createEvent(uint _date, uint _time, uint _eventId, uint _ticketId ) external onlyeventMaster{
            EventInfo storage eventInfo = events[_eventId];

            events.date = _date;

            events.time = _time;

            events.ticketId = _ticketId;

    }

        function mintTicket() external {
            require(!hasMintedTicket[msg.sender],"Already minted NFT!");

            hasMintedTicket[msg.sender][_eventId] = true;
            events[_eventId].attendees.push(msg.sender);
            noOfAttendants++;

        }  


        function getCreatedEvents(uint _eventId) external returns (uint256) onlyOwner {
            return events[_eventId];

        }
            



    }

}