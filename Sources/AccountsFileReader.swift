import Foundation

class AccountsFileReader {

  class func read(_ path: URL) -> [String] {
    do {
      let contents = try String(contentsOf: path)
      let accounts = contents.components(separatedBy: "\n")

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
    } catch {
      print(error)
      return []
    }
  }

}
