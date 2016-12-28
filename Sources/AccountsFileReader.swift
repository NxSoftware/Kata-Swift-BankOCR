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
    
    var entries = [String]()
    
    for start in stride(from: 0, to: numberOfAccounts, by: EntryReader.linesPerEntry) {
      let end = min(start + EntryReader.linesPerEntry, numberOfAccounts)
      let account = Array(accounts[start..<end])
      
      if let entry = EntryReader.read(account) {
        entries.append(entry)
      }
    }
    
    return entries
  }

}
