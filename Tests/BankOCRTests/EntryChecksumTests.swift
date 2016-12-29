import XCTest
@testable import BankOCR

class EntryChecksumTests: XCTestCase {

  func test000000000_hasChecksumOf0() {
    XCTAssertEqual(0, Entry(value: "000000000").checksum, "Checksum should be 0 for 000000000")
  }

}
