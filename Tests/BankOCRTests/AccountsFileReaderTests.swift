import XCTest
@testable import BankOCR

class AccountsFileReaderTests: XCTestCase {

  func testEmptyInput_GivesEmptyArray() {
    let url = URL(fileURLWithPath: "Account Files/empty.txt")
    XCTAssertEqual(0, AccountsFileReader.read(url).count, "Empty input should return an empty array")
  }

  func testSingleEntryOf123456789_GivesArrayWith123456789() {
    let url = URL(fileURLWithPath: "Account Files/123456789.txt")
    XCTAssertEqual(["123456789"], AccountsFileReader.read(url), "Single entry should be the only thing in the array")
  }

  func testThreeEntries_GivesArrayWithThreeEntries() {
    let url = URL(fileURLWithPath: "Account Files/several.txt")
    let expected = [
      "123456789",
      "490067715",
      "000000051"
    ]
    XCTAssertEqual(expected, AccountsFileReader.read(url), "Several entries should all be in the array")
  }

}
