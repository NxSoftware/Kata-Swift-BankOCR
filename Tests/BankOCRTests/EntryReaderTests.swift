import XCTest
@testable import BankOCR

class EntryReaderTests: XCTestCase {

  func testEmptyInput_returnsNil() {
    XCTAssertNil(EntryReader.read([]), "Empty input should return nil")
  }

  func test000000000_returns000000000() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "| || || || || || || || || |",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("000000000", entry?.value, "All zeroes should return 000000000")
  }

  func test111111111_returns111111111() {
    let input = ["                           ",
                 "  |  |  |  |  |  |  |  |  |",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("111111111", entry?.value, "All ones should return 111111111")
  }

  func test222222222_returns222222222() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 " _| _| _| _| _| _| _| _| _|",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("222222222", entry?.value, "All twos should return 222222222")
  }

  func test333333333_returns333333333() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 " _| _| _| _| _| _| _| _| _|",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("333333333", entry?.value, "All threes should return 333333333")
  }

  func test444444444_returns444444444() {
    let input = ["                           ",
                 "|_||_||_||_||_||_||_||_||_|",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("444444444", entry?.value, "All fours should return 444444444")
  }

  func test555555555_returns555555555() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("555555555", entry?.value, "All fives should return 555555555")
  }

  func test666666666_returns666666666() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("666666666", entry?.value, "All sixes should return 666666666")
  }

  func test777777777_returns777777777() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "  |  |  |  |  |  |  |  |  |",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("777777777", entry?.value, "All sevens should return 777777777")
  }

  func test888888888_returns888888888() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("888888888", entry?.value, "All eights should return 888888888")
  }

  func test999999999_returns999999999() {
    let input = [" _  _  _  _  _  _  _  _  _ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("999999999", entry?.value, "All nines should return 999999999")
  }

  func test123456789_returns123456789() {
    let input = ["    _  _     _  _  _  _  _ ",
                 "  | _| _||_||_ |_   ||_||_|",
                 "  ||_  _|  | _||_|  ||_| _|",
                 ""]

    let entry = EntryReader.read(input)
    XCTAssertNotNil(entry, "An entry should have been created for this number")
    XCTAssertEqual("123456789", entry?.value, "123456789 should return 123456789")
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
