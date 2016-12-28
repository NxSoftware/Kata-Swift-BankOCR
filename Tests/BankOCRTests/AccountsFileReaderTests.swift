import XCTest
@testable import BankOCR

class AccountsFileReaderTests: XCTestCase {

  func testEmptyInput_GivesEmptyArray() {
    let url = URL(fileURLWithPath: "Account Files/empty.txt")
    XCTAssertEqual(0, AccountsFileReader.read(url).count, "Empty input should return an empty array")
  }

}
