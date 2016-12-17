import XCTest
@testable import BankOCR

class CharacterReaderTests: XCTestCase {
    func testEmptyInput_returnsNil() {
      XCTAssertNil(CharacterReader.read(""), "Empty input should provide nil output")
    }

    func testZero_returns0() {
      let digit = " _ " + "\n" +
                  "| |" + "\n" +
                  "|_|"
      XCTAssertEqual(0, CharacterReader.read(digit), "Given zero, expected 0")
    }

    func testOne_returns1() {
      let digit = "   " + "\n" +
                  "  |" + "\n" +
                  "  |"
      XCTAssertEqual(1, CharacterReader.read(digit), "Given one, expected 1")
    }

    func testTwo_returns2() {
      let digit = " _ " + "\n" +
                  " _|" + "\n" +
                  "|_ "
      XCTAssertEqual(2, CharacterReader.read(digit), "Given two, expected 2")
    }

    func testThree_returns3() {
      let digit = " _ " + "\n" +
                  " _|" + "\n" +
                  " _|"
      XCTAssertEqual(3, CharacterReader.read(digit), "Given three, expected 3")
    }

    func testFour_returns4() {
      let digit = "   " + "\n" +
                  "|_|" + "\n" +
                  "  |"
      XCTAssertEqual(4, CharacterReader.read(digit), "Given four, expected 4")
    }

    func testFive_returns5() {
      let digit = " _ " + "\n" +
                  "|_ " + "\n" +
                  " _|"
      XCTAssertEqual(5, CharacterReader.read(digit), "Given five, expected 5")
    }

    func testSix_returns6() {
      let digit = " _ " + "\n" +
                  "|_ " + "\n" +
                  "|_|"
      XCTAssertEqual(6, CharacterReader.read(digit), "Given six, expected 6")
    }

    func testSeven_returns7() {
      let digit = " _ " + "\n" +
                  "  |" + "\n" +
                  "  |"
      XCTAssertEqual(7, CharacterReader.read(digit), "Given seven, expected 7")
    }

    func testEight_returns8() {
      let digit = " _ " + "\n" +
                  "|_|" + "\n" +
                  "|_|"
      XCTAssertEqual(8, CharacterReader.read(digit), "Given eight, expected 8")
    }

/*
    use case 1
     _  _  _  _  _  _  _  _  _
    | || || || || || || || || |
    |_||_||_||_||_||_||_||_||_|

    =&gt; 000000000

      |  |  |  |  |  |  |  |  |
      |  |  |  |  |  |  |  |  |

    =&gt; 111111111
     _  _  _  _  _  _  _  _  _
     _| _| _| _| _| _| _| _| _|
    |_ |_ |_ |_ |_ |_ |_ |_ |_

    =&gt; 222222222
     _  _  _  _  _  _  _  _  _
     _| _| _| _| _| _| _| _| _|
     _| _| _| _| _| _| _| _| _|

    =&gt; 333333333

    |_||_||_||_||_||_||_||_||_|
      |  |  |  |  |  |  |  |  |

    =&gt; 444444444
     _  _  _  _  _  _  _  _  _
    |_ |_ |_ |_ |_ |_ |_ |_ |_
     _| _| _| _| _| _| _| _| _|

    =&gt; 555555555
     _  _  _  _  _  _  _  _  _
    |_ |_ |_ |_ |_ |_ |_ |_ |_
    |_||_||_||_||_||_||_||_||_|

    =&gt; 666666666
     _  _  _  _  _  _  _  _  _
      |  |  |  |  |  |  |  |  |
      |  |  |  |  |  |  |  |  |

    =&gt; 777777777
     _  _  _  _  _  _  _  _  _
    |_||_||_||_||_||_||_||_||_|
    |_||_||_||_||_||_||_||_||_|

    =&gt; 888888888
     _  _  _  _  _  _  _  _  _
    |_||_||_||_||_||_||_||_||_|
     _| _| _| _| _| _| _| _| _|

    =&gt; 999999999
        _  _     _  _  _  _  _
      | _| _||_||_ |_   ||_||_|
      ||_  _|  | _||_|  ||_| _|

    =&gt; 123456789*/

}
