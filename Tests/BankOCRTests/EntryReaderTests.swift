import XCTest
@testable import BankOCR

class EntryReaderTests: XCTestCase {

  func testEmptyInput_returnsNil() {
    XCTAssertNil(EntryReader.read([]), "Empty input should return nil")
  }

  func test000000000_returns000000000() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "| || || || || || || || || |",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]
    XCTAssertEqual("000000000", EntryReader.read(entry), "All zeroes should return 000000000")
  }

  func test111111111_returns111111111() {
    let entry = ["                           ",
                 "  |  |  |  |  |  |  |  |  |",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]
    XCTAssertEqual("111111111", EntryReader.read(entry), "All ones should return 111111111")
  }

  func test222222222_returns222222222() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 " _| _| _| _| _| _| _| _| _|",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 ""]

    XCTAssertEqual("222222222", EntryReader.read(entry), "All twos should return 222222222")
  }

  func test333333333_returns333333333() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 " _| _| _| _| _| _| _| _| _|",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    XCTAssertEqual("333333333", EntryReader.read(entry), "All threes should return 333333333")
  }

  func test444444444_returns444444444() {
    let entry = ["                           ",
                 "|_||_||_||_||_||_||_||_||_|",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]

    XCTAssertEqual("444444444", EntryReader.read(entry), "All fours should return 444444444")
  }

  func test555555555_returns555555555() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    XCTAssertEqual("555555555", EntryReader.read(entry), "All fives should return 555555555")
  }

  func test666666666_returns666666666() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]

    XCTAssertEqual("666666666", EntryReader.read(entry), "All sixes should return 666666666")
  }

  func test777777777_returns777777777() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "  |  |  |  |  |  |  |  |  |",
                 "  |  |  |  |  |  |  |  |  |",
                 ""]
    XCTAssertEqual("777777777", EntryReader.read(entry), "All ones should return 777777777")
  }

  func test888888888_returns888888888() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 "|_||_||_||_||_||_||_||_||_|",
                 ""]

    XCTAssertEqual("888888888", EntryReader.read(entry), "All eights should return 888888888")
  }

  func test999999999_returns999999999() {
    let entry = [" _  _  _  _  _  _  _  _  _ ",
                 "|_||_||_||_||_||_||_||_||_|",
                 " _| _| _| _| _| _| _| _| _|",
                 ""]

    XCTAssertEqual("999999999", EntryReader.read(entry), "All nines should return 999999999")
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
