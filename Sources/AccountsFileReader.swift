import Foundation

class AccountsFileReader {

  class func read(_ path: URL) -> [String] {
    do {
      let contents = try String(contentsOf: path)
      return parseEntries(from: contents)
    } catch {
      print(error)
      return []
    }
  }
  
  private class func parseEntries(from input: String) -> [String] {
    let accounts = input.components(separatedBy: "\n")
    
    return slice(accounts).flatMap {
      parseEntry(startingAt: $0, from: accounts)
    }
  }
  
  class func slice(_ accounts: [String]) -> StrideTo<Int> {
    return stride(from: 0, to: accounts.count, by: EntryReader.linesPerEntry)
  }
  
  class func parseEntry(startingAt start: Int, from accounts: [String]) -> String? {
    let end = min(start + EntryReader.linesPerEntry, accounts.count)
    let account = Array(accounts[start..<end])
    return EntryReader.read(account)
  }

}
