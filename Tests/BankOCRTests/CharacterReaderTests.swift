import XCTest
@testable import BankOCR

class CharacterReaderTests: XCTestCase {
    func testEmptyInput_returnsNil() {
      XCTAssertNil(CharacterReader.read([]), "Empty input should provide nil output")
    }

    func testZero_returns0() {
      let character = CharacterReader.read(SevenSegmentComponents.zero)!
      XCTAssertEqual(0, character.value, "Given zero, expected 0")
    }

    func testOne_returns1() {
      let character = CharacterReader.read(SevenSegmentComponents.one)!
      XCTAssertEqual(1, character.value, "Given one, expected 1")
    }

    func testTwo_returns2() {
      let character = CharacterReader.read(SevenSegmentComponents.two)!
      XCTAssertEqual(2, character.value, "Given two, expected 2")
    }

    func testThree_returns3() {
      let character = CharacterReader.read(SevenSegmentComponents.three)!
      XCTAssertEqual(3, character.value, "Given three, expected 3")
    }

    func testFour_returns4() {
      let character = CharacterReader.read(SevenSegmentComponents.four)!
      XCTAssertEqual(4, character.value, "Given four, expected 4")
    }

    func testFive_returns5() {
      let character = CharacterReader.read(SevenSegmentComponents.five)!
      XCTAssertEqual(5, character.value, "Given five, expected 5")
    }

    func testSix_returns6() {
      let character = CharacterReader.read(SevenSegmentComponents.six)!
      XCTAssertEqual(6, character.value, "Given six, expected 6")
    }

    func testSeven_returns7() {
      let character = CharacterReader.read(SevenSegmentComponents.seven)!
      XCTAssertEqual(7, character.value, "Given seven, expected 7")
    }

    func testEight_returns8() {
      let character = CharacterReader.read(SevenSegmentComponents.eight)!
      XCTAssertEqual(8, character.value, "Given eight, expected 8")
    }

    func testNine_returns9() {
      let character = CharacterReader.read(SevenSegmentComponents.nine)!
      XCTAssertEqual(9, character.value, "Given nine, expected 9")
    }

}
