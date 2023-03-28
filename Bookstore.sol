// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * Bookstore Smart Contract
 * This contract allows users to publish copies of books, to purchase books and interact with the books uploaded
 */
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Bookstore is ERC1155 {

    mapping(uint256 => BookDetails) private _bookDetails;
    struct BookDetails {
        address author;
        string title;
        uint256 copies;
    }

    uint256 public tokenCounter;

    constructor() ERC1155("http://") {
        tokenCounter = 0;
    }

    function publish(string memory _title, uint256 _copies) public{
            uint256 newTokenId = tokenCounter+1;
            _bookdetails[newtoken.Id].author = msg.sender;
            _bookdetails[newtoken.Id].title = _title;
            _bookdetails[newtoken.Id].copies = _copies;
            _mint(msg.sender, newTokenId, _copies, "");
            tokenCounter += 1;
    }

    function Approve(address operator) public {
        require(operator != msg.sender);
        setApprovalForAll(operator, true);
    }

    function purchaseFromAuthor(uint256 TokenId, uint256 _copies) public {
        saleTransferFrom(_bookDetails[TokenId].author, msg.sender, TokenId, _copies, "");
    }

    function TitleOfTheBook(uint256 BookId) public view returns(string memory) {
        return (_bookdetails[BookId].title);
    }

    function TotalCopiesOfTheBook(uint256 BookId) public view returns(uint256) {
        return (_bookdetails[BookId].copies);
    }

    function AuthorOfTheBook(uint256 BookId) public view returns(address) {
        return (_bookdetails[BookId].author);
    }
}
