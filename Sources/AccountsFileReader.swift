import Foundation

class AccountsFileReader {

  class func read(_ path: URL) -> [String] {
    do {
      let contents = try String(contentsOf: path)
      let accounts = contents.components(separatedBy: "\n")

      var entries = [String]()

      if accounts.count == 4 {
        if let entry = EntryReader.read(accounts) {
          entries.append(entry)
        }
      }

      return entries
    } catch {
      print(error)
      return []
    }
  }

}
