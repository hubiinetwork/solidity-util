pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "../contracts/Addresses.sol";

/**
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract AddressesTests {
    using Addresses for address;
    using Addresses for address payable;
    
    function testIsContract() public  {
        Assert.isTrue(address(this).isContract(), "This (address) is contract");
        Assert.isFalse(msg.sender.isContract(), "Sender (address payable) is non-contract");
    }
}
