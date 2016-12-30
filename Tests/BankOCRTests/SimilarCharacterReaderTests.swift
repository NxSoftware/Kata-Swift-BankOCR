import XCTest
@testable import BankOCR

class SimilarCharacterReaderTests: XCTestCase {

  func testSimilarCharacterFor0_is8() {
    let character = CharacterReader.read(SevenSegmentComponents.zero)!
    XCTAssertEqual([8], character.alternatives, "Similar values for 0 should be 8")
  }

}
