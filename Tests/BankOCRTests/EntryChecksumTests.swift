import XCTest
@testable import BankOCR

class EntryChecksumTests: XCTestCase {

  func test000000000_hasChecksumOf0() {
    XCTAssertEqual(0, Entry(value: "000000000").checksum, "Checksum should be 0 for 000000000")
  }

  func test111111111_hasChecksumOf1() {
    XCTAssertEqual(1, Entry(value: "111111111").checksum, "Checksum should be 1 for 111111111")
  }
  
  func test222222222_hasChecksumOf2() {
    XCTAssertEqual(2, Entry(value: "222222222").checksum, "Checksum should be 2 for 222222222")
  }
  
  func test333333333_hasChecksumOf3() {
    XCTAssertEqual(3, Entry(value: "333333333").checksum, "Checksum should be 3 for 333333333")
  }
  
  func test444444444_hasChecksumOf4() {
    XCTAssertEqual(4, Entry(value: "444444444").checksum, "Checksum should be 4 for 444444444")
  }
  
  func test555555555_hasChecksumOf5() {
    XCTAssertEqual(5, Entry(value: "555555555").checksum, "Checksum should be 5 for 555555555")
  }
  
  func test666666666_hasChecksumOf6() {
    XCTAssertEqual(6, Entry(value: "666666666").checksum, "Checksum should be 6 for 666666666")
  }
  
  func test777777777_hasChecksumOf7() {
    XCTAssertEqual(7, Entry(value: "777777777").checksum, "Checksum should be 7 for 777777777")
  }
  
  func test888888888_hasChecksumOf8() {
    XCTAssertEqual(8, Entry(value: "888888888").checksum, "Checksum should be 8 for 888888888")
  }
  
  func test999999999_hasChecksumOf9() {
    XCTAssertEqual(9, Entry(value: "999999999").checksum, "Checksum should be 9 for 999999999")
  }
  
  func test123456789_hasChecksumOf0() {
    XCTAssertEqual(0, Entry(value: "123456789").checksum, "Checksum should be 0 for 123456789")
  }

  func test457508000_hasChecksumOf0() {
    XCTAssertEqual(0, Entry(value: "457508000").checksum, "Checksum should be 0 for 457508000")
  }
  
  func test345882865_hasChecksumOf0() {
    XCTAssertEqual(0, Entry(value: "345882865").checksum, "Checksum should be 0 for 345882865")
  }
  
  func test490067715_hasChecksumOf7() {
    XCTAssertEqual(7, Entry(value: "490067715").checksum, "Checksum should be 7 for 490067715")
  }
  
  func test664371495_hasChecksumOf2() {
    XCTAssertEqual(2, Entry(value: "664371495").checksum, "Checksum should be 2 for 664371495")
  }
  
}
