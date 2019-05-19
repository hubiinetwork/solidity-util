pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "../contracts/Strings.sol";

/**
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract StringsTest {
    using Strings for string;

    /**
     * Run this test first to ensure that the compareTo is correct as some
     * other tests depend on it
     */
    function testCompareTo() public {
        string memory myVal = "my testing split";
        Assert.isFalse(myVal.compareTo("invalid"), "Should not equal invalid string");
        Assert.isTrue(myVal.compareTo("my testing split"), "Should equal valid string");
        Assert.isFalse(myVal.compareTo("mY Testing split"), "Should not equal valid string in alternate casing");
        Assert.isFalse(myVal.compareTo(""), "Should not equal empty string");
    }

    function testConcat() public {
        string memory myVal = "prefix_";
        Assert.equal(myVal.concat("suffix"), "prefix_suffix", "Should concat with suffix");
        Assert.equal(myVal.concat("suffix").concat("_another"), "prefix_suffix_another", "Should concat sequentially");
        Assert.notEqual(myVal.concat("fail"), "prefix_", "Should not skip concatenation");
    }

    function testIndexOf() public {
        string memory myVal = "haystack";
        Assert.equal(myVal.indexOf("a"), 1, "Should index existent letter");
        Assert.equal(myVal.indexOf("A"), -1, "Should not index existent letter in alternate casing");
        Assert.equal(myVal.indexOf("z"), -1, "Should not index non-existent letter");
    }

    function test_IndexOf() public {
        string memory myVal = "haystack";
        Assert.equal(myVal._indexOf("a", 2), 5, "Should index existent letter");
        Assert.equal(myVal._indexOf("A", 2), -1, "Should not index existent letter in alternate casing");
        Assert.equal(myVal._indexOf("h", 2), -1, "Should not index non-existent letter");
    }

    function testLength() public {
        string memory myVal = "length";
        Assert.equal(myVal.length(), 6, "Should measure correct length");
    }

    function testSubstring() public {
        string memory myVal = "sub string testing";
        Assert.equal(myVal.substring(3), "sub", "Should substring one word");
        Assert.equal(myVal.substring(10), "sub string", "Should substring two words");
    }

    function test_Substring() public {
        string memory myVal = "sub string testing";
        Assert.equal(myVal._substring(6, 4), "string", "Should substring one word");
        Assert.equal(myVal._substring(7, 11), "testing", "Should substring two words");
    }

    function testUpper() public {
        string memory myVal = "lower";
        Assert.equal(myVal.upper(), "LOWER", "Should uppercase");
    }

    function testLower() public {
        string memory myVal = "UPPER";
        Assert.equal(myVal.lower(), "upper", "Should lowercase");
    }

    function testSplit() public {
        string memory myVal = "my testing split";
        string[] memory split = myVal.split(" ");
        Assert.equal(3, split.length, "Should split into the right number of components");
        Assert.equal(split[0], "my", "Should return first component");
        Assert.equal(split[1], "testing", "Should return second component");
        Assert.equal(split[2], "split", "Should return third component");
    }

    function testCompareToIgnoreCase() public {
        string memory myVal = "my testing split";
        Assert.isFalse(myVal.compareToIgnoreCase("invalid"), "Should not equal invalid string");
        Assert.isTrue(myVal.compareToIgnoreCase("my testing split"), "Should equal valid string");
        Assert.isTrue(myVal.compareToIgnoreCase("mY Testing split"), "Should equal valid string in alternate casing");
    }
}

