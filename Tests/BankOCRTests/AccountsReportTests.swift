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
  
  func testEntryWithIllegibleDigits_IsDecoratedWithILL() {
    let url = URL(fileURLWithPath: "Account Files/49006771?.txt")
    XCTAssertEqual(["49006771? ILL"], AccountsReport.read(url), "Entry with illegible digits should be decorated with the ILL status")
  }
  
  func testGenerateReport_GivesOneEntryPerLine() {
    let url = URL(fileURLWithPath: "Account Files/report.txt")
    let expected = "000000051\n49006771? ILL\n1234?678? ILL\n777777777 ERR"
    XCTAssertEqual(expected, AccountsReport.report(url), "Report should be formatted with one entry per line")
  }

}
