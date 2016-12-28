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
    
    var account = [String]()
    var entries = [String]()
    
    for (lineNumber, line) in accounts.enumerated() {
      account.append(line)

      if (lineNumber + 1) % 4 == 0 {
        if let entry = EntryReader.read(account) {
          entries.append(entry)
        }
        account.removeAll()
      }
    }
    
    return entries
  }

}
