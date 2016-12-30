import XCTest
@testable import BankOCR

class CharacterReaderTests: XCTestCase {
    func testEmptyInput_returnsNil() {
      XCTAssertNil(CharacterReader.read([]), "Empty input should provide nil output")
    }

    func testZero_returns0() {
      let digit = [" _ ",
                   "| |",
                   "|_|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(0, character.value, "Given zero, expected 0")
    }

    func testOne_returns1() {
      let digit = ["   ",
                   "  |",
                   "  |"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(1, character.value, "Given one, expected 1")
    }

    func testTwo_returns2() {
      let digit = [" _ ",
                   " _|",
                   "|_ "]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(2, character.value, "Given two, expected 2")
    }

    func testThree_returns3() {
      let digit = [" _ ",
                   " _|",
                   " _|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(3, character.value, "Given three, expected 3")
    }

    func testFour_returns4() {
      let digit = ["   ",
                   "|_|",
                   "  |"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(4, character.value, "Given four, expected 4")
    }

    func testFive_returns5() {
      let digit = [" _ ",
                   "|_ ",
                   " _|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(5, character.value, "Given five, expected 5")
    }

    func testSix_returns6() {
      let digit = [" _ ",
                   "|_ ",
                   "|_|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(6, character.value, "Given six, expected 6")
    }

    func testSeven_returns7() {
      let digit = [" _ ",
                   "  |",
                   "  |"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(7, character.value, "Given seven, expected 7")
    }

    func testEight_returns8() {
      let digit = [" _ ",
                   "|_|",
                   "|_|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(8, character.value, "Given eight, expected 8")
    }

    func testNine_returns9() {
      let digit = [" _ ",
                   "|_|",
                   " _|"]
      let character = CharacterReader.read(digit)!
      XCTAssertEqual(9, character.value, "Given nine, expected 9")
    }

}
