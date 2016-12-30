import XCTest
@testable import BankOCR

class AccountsReportTests: XCTestCase {

  func testValidEntry_HasNoStatusDecoration() {
    let url = URL(fileURLWithPath: "Account Files/123456789.txt")
    XCTAssertEqual(["123456789"], AccountsReport.read(url), "Valid entry should not be decorated with a status")
  }

}
