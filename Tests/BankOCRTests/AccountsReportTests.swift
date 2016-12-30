import XCTest
@testable import BankOCR

class AccountsReportTests: XCTestCase {

  func testValidEntry_HasNoStatusDecoration() {
    let url = URL(fileURLWithPath: "Account Files/123456789.txt")
    XCTAssertEqual(["123456789"], AccountsReport.read(url), "Valid entry should not be decorated with a status")
  }
  
  func testEntryWithInvalidChecksum_IsDecoratedWithERR() {
    let url = URL(fileURLWithPath: "Account Files/000000052.txt")
    XCTAssertEqual(["000000052 ERR"], AccountsReport.read(url), "Entry with invalid checksum should be decorated with the ERR status")
  }

}
