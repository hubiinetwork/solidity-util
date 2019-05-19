pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "../contracts/Strings.sol";
import "../contracts/Integers.sol";

/**
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract TestIntegers {
    using Integers for uint;
    using Strings for string;
    
    function testToString() public {
        uint example = 1223;
        Assert.equal(example.toString(), "1223", "Should equal string");
    }
    
    function testParseInt() public {
        Assert.equal(Integers.parseInt("321"), 321, "Should equal integer");
    }
}