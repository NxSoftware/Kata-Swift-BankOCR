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
    let numberOfAccounts: Int = accounts.count
    
    return slice(accounts).flatMap { start in
      let end = min(start + EntryReader.linesPerEntry, numberOfAccounts)
      let account = Array(accounts[start..<end])
      
      return EntryReader.read(account)
    }
  }
  
  class func slice(_ accounts: [String]) -> StrideTo<Int> {
    return stride(from: 0, to: accounts.count, by: EntryReader.linesPerEntry)
  }

}
